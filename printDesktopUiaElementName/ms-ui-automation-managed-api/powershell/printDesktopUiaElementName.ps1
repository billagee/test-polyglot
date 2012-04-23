# printDesktopUiaElementName.ps1
#
# From https://github.com/billagee/test-polyglot
#
# Demonstrates that when using the managed UI Automation API, the root
# (dekstop) AutomationElement has an empty Name.
#
# Instead, to identify the desktop you can use its ClassName.
#
# Tested with:
# - Windows 7 32-bit
# - PowerShell 2.0

# Get the root element
$rootElement = [Windows.Automation.AutomationElement]::RootElement
# Print its Name and ClassName
Write-Host "Note: In the managed UIA API, the desktop name is empty:"
"'" + $rootElement.Current.Name + "'"
Write-Host "Instead, you can identify the desktop by its ClassName, #32769:"
"'" + $rootElement.Current.ClassName + "'"

