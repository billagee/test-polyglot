=begin

print_desktop_uia_element_name.rb

From https://github.com/billagee/test-polyglot

This script shows how to use wprintf() and a few functions from the
MS UI Automation COM interface (IUIAutomation) to print the name
of the desktop's IUIAutomationElement on a Windows machine.
For more information see the MS docs on:

IUIAutomation::GetRootElement
http://msdn.microsoft.com/en-us/library/windows/desktop/ee671544(v=vs.85).aspx

IUIAutomationElement::get_CurrentName
http://msdn.microsoft.com/en-us/library/windows/desktop/ee696022(v=vs.85).aspx


Other good sources of information:

http://en.wikipedia.org/wiki/Microsoft_UI_Automation

The IUIAutomation docs:
  http://msdn.microsoft.com/en-us/library/ms726294(VS.85).aspx

Your local copy of UIAutomationClient.h, installed with the Windows SDK:
  \Program Files\Microsoft SDKs\Windows\v7.1\Include\UIAutomationClient.h

=end

require 'rubygems'
require 'windows/com'
require 'windows/com/automation'
require 'windows/com/variant'
require 'windows/msvcrt/buffer'
require 'windows/msvcrt/string'
require 'windows/unicode'
require 'windows/error'

include Windows::COM
include Windows::COM::Automation
include Windows::COM::Variant
include Windows::MSVCRT::Buffer
include Windows::MSVCRT::String
include Windows::Unicode
include Windows::Error

# Convenience method for transforming a Ruby string to a wide-char C string
def get_wide_str_ptr(ruby_str)
  # Get a wide-character version of the string
  wide_str = multi_to_wide(ruby_str)
  # Place the wide string in an array, and pack the array as a pointer to a
  # null-terminated string
  packed_str = [wide_str].pack('p') # Can also use 'p*'
  # Get the memory address of the packed array, by unpacking it as an
  # unsigned long:
  packed_str.unpack('L').first # Can also use [0]
end

# Constants (from UIAutomationClient.h)
IID_CUIAutomation = [0xff48dba4, 0x60ef, 0x4201, 0xaa, 0x87, 0x54, 0x10, 0x3e, 0xef, 0x59, 0x4e].pack('LSSC8')
IID_IUIAutomation = [0x30cbe57d, 0xd9d0, 0x452a, 0xab, 0x13, 0x7a, 0xc5, 0xac, 0x48, 0x25, 0xee].pack('LSSC8')
UIA_NamePropertyId = 30005;

# Initialize COM
CoInitialize(nil)

# Instantiate the CUIAutomation object and store its IUIAutomation interface
# in iuia_ptr
#
# (See: http://rubyforge.org/pipermail/win32utils-devel/2008-June/001125.html)
iuia_ptr = 0.chr * 4
hr = CoCreateInstance(
  IID_CUIAutomation,
  nil,
  CLSCTX_INPROC_SERVER,
  IID_IUIAutomation,
  iuia_ptr
)
puts "HRESULT of CoCreateInstance is: " + hr.to_s

# Get a pointer to the iuia_ptr, which we'll use for the IUIAutomation functions
iuia_ptr_ptr = iuia_ptr.unpack('L').first

# The next thing to do is invoke the IUIAutomation::GetRootElement method,
# to get the desktop's automation element.  To describe how to do that:
#
# - Get the virtual function table of the IUIAutomation object
# - Find the GetRootElement function in the table
# - Call GetRootElement
#
# For more info see these examples:
#   http://rubyforge.org/forum/forum.php?thread_id=33188&forum_id=319
#   http://rubyforge.org/pipermail/win32utils-devel/2010-October/001624.html

# Allocate 4 bytes to store a pointer to the vtbl:
iuia_vtbl_ptr = 0.chr * 4
# Allocate 4*58 bytes for the table, since there are 58 functions in the C
# interface's IUIAutomationVtbl struct (see UIAutomationClient.h).
iuia_table = 0.chr * (4 * 58)

# Make a copy of iuia_ptr that we can muck about with.
Memcpy.call(iuia_vtbl_ptr, iuia_ptr_ptr, 4)

# Copy the 4*58 bytes at the iuia_vtbl_ptr memory address to iuia_table
Memcpy.call(iuia_table, iuia_vtbl_ptr.unpack('L').first, 4 * 58)

# Unpack the contents of the virtual function table into the 'iuia_table' array.
iuia_table = iuia_table.unpack('L*')
puts "Number of elements in the vtbl is: " + iuia_table.length.to_s

# GetRootElement is the 6th function in the vtbl.  Both the 'This' pointer
# and the out param must be specified as args, due to the C style interface:
GetRootElement = Win32::API::Function.new(iuia_table[5], 'PP', 'L')

# Call GetRootElement to get a pointer to the desktop IUIAutomationElement
desktop_ptr = 0.chr * 4
hr = GetRootElement.call(iuia_ptr.unpack('L').first, desktop_ptr)
puts "HRESULT of GetRootElement is: " + hr.to_s

# To get the element's name, we need to call the get_CurrentName function.
# The function can be accessed through the IUIAutomationElement vtbl - and we
# can get the vtbl from the root element pointer.
#
# Allocate 4*85 bytes for the table, since there are 85 functions in the C
# interface's IUIAutomationElementVtbl struct (see UIAutomationClient.h).
element_vtbl_ptr = 0.chr * 4
element_table = 0.chr * (4 * 85)

# Make a copy of desktop_ptr using its memory address
Memcpy.call(element_vtbl_ptr, desktop_ptr.unpack('L').first, 4)
# Unpack the contents of the virtual function table into the table array.
Memcpy.call(element_table, element_vtbl_ptr.unpack('L').first, 4 * 85)
element_table = element_table.unpack('L*')
puts "Number of elements in the vtbl is: " + element_table.length.to_s

# IUIAutomationElement::get_CurrentName is the 24th function in the vtbl.
Get_CurrentName = Win32::API::Function.new(element_table[23], 'PP', 'L')

# Create buffer for the BSTR that will receive the name from Get_CurrentName()
root_element_name = 0.chr * 4
hr = Get_CurrentName.call(desktop_ptr.unpack('L').first, root_element_name)
puts hr
#puts get_last_error(hr)

# Print the name of the root element
Wprintf = Windows::API.new('wprintf', 'PP', 'I', 'msvcrt')
format_str = "The string is: '%s'\n"
Wprintf.call(get_wide_str_ptr(format_str), root_element_name.unpack('L').first)

CoUninitialize()
