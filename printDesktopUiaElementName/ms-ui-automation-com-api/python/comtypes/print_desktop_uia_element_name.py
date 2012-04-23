# print_desktop_uia_element_name.py
#
# From https://github.com/billagee/test-polyglot
#
# Prints the name of the root (desktop) UI automation element, using the
# Windows 7 UI Automation COM API from Python.
#
# Depends on the Python comtypes package:
#   http://sourceforge.net/projects/comtypes/
#
# Tested with:
# - Python 2.7.2 32-bit
# - comtypes-0.6.2.win32.exe

import comtypes

from comtypes import *
from comtypes.client import *

# Generate and import a wrapper module for the UI Automation type library,
# using UIAutomationCore.dll
comtypes.client.GetModule('UIAutomationCore.dll')
from comtypes.gen.UIAutomationClient import *

# Instantiate the CUIAutomation object and get the global IUIAutomation pointer:
iuia = CoCreateInstance(CUIAutomation._reg_clsid_,
                        interface=IUIAutomation,
                        clsctx=CLSCTX_INPROC_SERVER)

# Get the root (desktop) element
desktop_element = iuia.getRootElement()

print "The root element name should be 'Desktop'."
print "The actual value is: '%s'" % (desktop_element.currentName)

