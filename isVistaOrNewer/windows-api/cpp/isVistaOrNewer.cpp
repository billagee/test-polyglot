// isVistaOrNewer.cpp
//
// Checks if the OS is Vista or later and prints the result to the console.
//
// From https://github.com/billagee/test-polyglot
//
// Built with MS Visual Studio C++ Express 2010
//
// For more info see the OSVERSIONINFO MSDN docs:
// http://msdn.microsoft.com/en-us/library/windows/desktop/ms724834(v=vs.85).aspx

#include <iostream>
#include <tchar.h>
#include <Wtypes.h>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	OSVERSIONINFO osvi;
	ZeroMemory(&osvi, sizeof(OSVERSIONINFO));
	osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	GetVersionEx(&osvi);
	wcout << "osvi.dwMajorVersion is " << osvi.dwMajorVersion << endl;
	wcout << "osvi.dwMinorVersion is " << osvi.dwMinorVersion << endl;
	// major version >= 6 is Vista or newer, < 6 is XP/2K3 Server or older
	if (osvi.dwMajorVersion >= 6)
		wcout << "OS is Vista or newer." << endl;
	else
		wcout << "OS is WinXP or older." << endl;

	return 0;
}
