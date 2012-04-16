# test-polyglot 
A collection of source files for programs that perform common
test automation tasks, implemented using different languages,
APIs, and (where appropriate) third-party libraries.

Or: An adventure in TMTOWTDI.

In this project, "polyglot" is used in the sense of a book
containing the same text in several different languages.

By Bill Agee ( http://www.likewise.org )

## Organization
Files in this repository are organized as follows:

````
program name/
  api/
    language/
      third-party library (if used)/
        source file(s)
````

## Table of Contents


````
isVistaOrNewer

  A program that tells you whether the OS is Vista or newer.

  Code examples:

isVistaOrNewer/
  windows-api/
    cpp/
      isVistaOrNewer.cpp
    ruby-mri/
      windows-pr/
        is_vista_or_newer.rb
  dotnet/
    csharp/
      isVistaOrNewer.cs

````

````
printDesktopUiaElementName

  Uses the Microsoft UI Automation API (UIA) to get and print the name
  of the root (desktop) UI automation element.

  Code examples:

printDesktopUiaElementName/
  ms-ui-automation-com-api/
    ruby-mri/
      windows-pr/
        print_desktop_uia_element_name.rb

TODO:

  ms-ui-automation-com-api/
    cpp/
      printDesktopUiaElementName.cpp
    python/
      comtypes/
        print_desktop_uia_element_name.py

  ms-ui-automation-dotnet/
    csharp/
      printDesktopElementName.cs
    ironruby/
      bewildr/
        print_desktop_element_name.rb
    powershell/
      printDesktopElementName.ps1
````

TODO:

````
printDesktopIAccessibleObjectName

  Uses the Microsoft Active Accessibility API (MSAA) to get and print
  the name of the desktop object's client element.  This element is the
  parent of all top-level open windows.

  ms-active-accessibility/
    cpp/
      printDesktopIAccessibleObjectName.cpp
    ruby-mri/
      windows-pr/
        print_desktop_iaccessible_object_name.rb
    python/
      comtypes/
        print_desktop_iaccessible_object_name.py
````

## License
(The MIT License)

Copyright (c) Bill Agee

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

