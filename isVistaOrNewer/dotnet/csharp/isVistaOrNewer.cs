// isVistaOrNewer.cs
//
// Checks if the OS is Vista or later and prints the result to the console.
//
// From https://github.com/billagee/test-polyglot
//
// Built with MS Visual Studio C# Express 2010

using System;

namespace isVistaOrNewer
{
    class Program
    {
        static void Main(string[] args)
        {
            OperatingSystem osInfo = Environment.OSVersion;
            Console.WriteLine("Major version is: " +
                osInfo.Version.Major.ToString());
            Console.WriteLine("Minor version is: " +
                osInfo.Version.Minor.ToString());

            if (osInfo.Version.Major >= 6)
                Console.WriteLine("OS is Vista or newer.");
            else
                Console.WriteLine("OS is XP or newer.");
        }
    }
}
