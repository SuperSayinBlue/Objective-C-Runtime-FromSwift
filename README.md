# Objective-C-Runtime-FromSwift
This project showcases a seamless integration between a client application written in Swift and a dynamic library (dylib) containing Objective-C functions. The goal is to provide developers with a clear example of how to dynamically link and call functions from a dylib at runtime within a Swift application.

## Project Overview

1. **Client Project :** The client application is a Swift project that demonstrates the process of interacting with a dynamic library at runtime using bridging headers.

2. **Dyna Project :** The dynamic library (dylib) project contains a collection of Objective-C functions that can be called from the Swift client. The dylib serves as an example of a reusable component that can be dynamically integrated into Swift applications.


## Why This Project Matters

- **Limited Examples:** Examples of dynamically linking and calling functions from a dylib within a Swift application are scarce.
[Apple Official Documentation regarding this](https://developer.apple.com/documentation/objectivec/objective-c_runtime)

- **Learning Resource:**  This project can serve as a working model that you can modify and debug your way up.

## Getting Started

1. Clone or download this repository.
2. Open the "RuntTimeDllLoad" workspace in Xcode.
3. Build Dyna project and then build and run client Project.

## Resolving Error
main: Unable to open library: dlopen(libDyna.dylib, 0x0004): tried: '/Users/admin/..../DerivedData/Build/Products/Release/libDyna.dylib' (file system sandbox blocked open()), 
- Provide Full Disk Access and File & Folder permission for Client app [Refer](https://stackoverflow.com/questions/44627957/mac-os-file-system-sandbox-blocked-open)
