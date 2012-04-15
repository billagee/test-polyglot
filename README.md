# test-polyglot 
Common test automation tasks, shown in different languages and libraries.

## Organization
Files in the project are organized as follows:

````
program name/
  api/
    language/
      dependencies (if needed)/
        source file(s)
````

## Table of Contents


````
isVistaOrNewer

  A program that tells you whether the OS is Vista or newer.

  Code examples:

  windows-api/
    cpp/
      isVistaOrNewer.cpp
    csharp/
      isVistaOrNewer.cs

````

TODO:

````
printDesktopUiaElementName

  Uses the Microsoft UI Automation API (UIA) to get and print the name
  of the root (desktop) UI automation element.

  Code examples:

  ms-ui-automation-com/
    cpp/
      printDesktopElementName.cpp
    python/
      comtypes/
        print_desktop_element_name.py
    ruby/
      windows-pr/
        print_desktop_element_name.rb
  ms-ui-automation-net/
    csharp/
      printDesktopElementName.cs
    ironruby/
      bewildr/
        print_desktop_element_name.rb
````

````
printDesktopIAccessibleObjectName

  Uses the Microsoft Active Accessibility API (MSAA) to get and print
  the name of the desktop object's client element.  This element is the
  parent of all top-level open windows.

  ms-active-accessibility/
    cpp/
      printDesktopIAccessibleObjectName.cpp
````

## License
(The MIT License)

Copyright (c) Bill Agee

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
