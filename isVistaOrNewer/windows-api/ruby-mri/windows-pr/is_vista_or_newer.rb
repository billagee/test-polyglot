=begin
  is_vista_or_newer.rb

  From https://github.com/billagee/test-polyglot

  Checks if the OS is Vista or later and prints the result to the console.

  Requires the windows-pr module:  https://github.com/djberg96/windows-pr 

  Tested with MRI ruby 1.9.3p125 (2012-02-16) [i386-mingw32]

  For more info see the windows-pr system_info.rb source:
  https://github.com/djberg96/windows-pr/blob/master/lib/windows/system_info.rb
=end

require 'rubygems'
require 'windows/system_info'

include Windows::SystemInfo

os_version = windows_version()
puts "Major.Minor OS version is: #{os_version}"

if (os_version >= 6.0 )
  puts "OS is Vista or newer."
else
  puts "OS is XP or older."
end

