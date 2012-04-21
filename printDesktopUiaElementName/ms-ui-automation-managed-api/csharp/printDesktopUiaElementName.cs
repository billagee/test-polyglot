// printDesktopUiaElementName.cs
//
// From https://github.com/billagee/test-polyglot
//
// Demonstrates that when using the managed UI Automation API, the root
// (dekstop) AutomationElement has an empty Name.
//
// Instead, to identify the desktop you can use its ClassName.
//
// N.B.: System.Windows.Automation requires a reference to these components
// found on the .NET "Add References" tab:
//
// UIAutomationClient
// UIAutomationClientTypes
//
// For more information see:
// http://social.msdn.microsoft.com/Forums/en-US/windowsaccessibilityandautomation/thread/e2d809bd-3b85-407e-a84d-21ca92c8e065

using System;
using System.Windows.Automation;

namespace printDesktopUiaElementName
{
    class printDesktopUiaElementName
    {
        static void Main(string[] args)
        {
            // Get the root element
            AutomationElement rootElement = AutomationElement.RootElement;
            // Get its name
            string rootName = rootElement.Current.Name;
            Console.WriteLine(
                "Note: In the managed UIA API, the desktop name is empty:");
            Console.WriteLine("'{0}'", rootName);
            Console.WriteLine(
                "You can identify the desktop by its ClassName, #32769:");
            Console.WriteLine("'{0}'", rootElement.Current.ClassName);
        }
    }
}
