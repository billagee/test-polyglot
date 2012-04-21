// PrintDesktopUiaElementNameViaCom
//
// From https://github.com/billagee/test-polyglot
//
// This program prints the name of the root (Desktop) AutomationElement,
// using the unmanaged Windows 7 UI Automation COM API from C#.
//
// It requires a reference to interop.UIAutomationCore.dll, a wrapper
// for the UIA COM API.  The wrapper file is included in this project.
//
// To use TlbImp.exe to generate interop.UIAutomationCore.dll yourself:
//
// "%PROGRAMFILES%\Microsoft SDKs\Windows\v7.1\bin\tlbimp.exe" %windir%\system32\UIAutomationCore.dll /out:interop.UIAutomationCore.dll
//
// The step to create interop.UIAutomationCore.dll is from an unmanaged
// UIA C# example project by Guy Barker, found here:
//
// http://code.msdn.microsoft.com/windowsdesktop/Windows-7-UI-Automation-0625f55e

using System;
using interop.UIAutomationCore;

namespace PrintDesktopUiaElementNameViaCom
{
    class PrintDesktopUiaElementNameViaComProgram
    {
        static void Main(string[] args)
        {
            // Instantiate the UIA object:
            IUIAutomation _automation = new CUIAutomation();
            // Get the root element
            IUIAutomationElement rootElement = _automation.GetRootElement();
            // Get its name
            string rootName = rootElement.CurrentName;
            Console.WriteLine(
                "The root automation element's name should be 'Desktop'.");
            Console.WriteLine("The actual value is: '{0}'", rootName);
        }
    }
}
