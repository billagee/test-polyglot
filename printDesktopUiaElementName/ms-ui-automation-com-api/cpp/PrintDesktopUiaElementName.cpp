// PrintDesktopUiaElementName.cpp
//
// From https://github.com/billagee/test-polyglot
//
// Prints the name of the root (desktop) UI automation element,
// using the Windows 7 UI Automation COM API from C++.
//
// Built with MS Visual Studio C++ Express 2010

#include <UIAutomation.h>
#include <tchar.h>
#include <iostream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	// Initialize COM and create the main Automation object
	CoInitialize(NULL);
	IUIAutomation *iuia;
	HRESULT hr = CoCreateInstance(
		__uuidof(CUIAutomation), NULL,
		CLSCTX_INPROC_SERVER, __uuidof(IUIAutomation),
		(void**)&iuia);
	if (FAILED(hr))
		return 1;

    // Get root (desktop) element
	IUIAutomationElement *desktop;
	hr = iuia->GetRootElement(&desktop);
	if (FAILED(hr))
		return 1;

	// Print the desktop element's name:
	BSTR desktopName;
	hr = desktop->get_CurrentName(&desktopName);
	if (SUCCEEDED(hr))
	{
		wcout << "The root element name should be 'Desktop'." << endl <<
			"The actual value is: '" << desktopName << "'" << endl;
		::SysFreeString(desktopName);
	}
	else
	{
		return 1;
	}

	// Clean up
	desktop->Release();
	iuia->Release();
	CoUninitialize();
	return 0;
}