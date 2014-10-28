Alfred Swift Library
---

This contains the code for the Alfred Swift library in the file Alfred.swift. The tcconverter.swift is the Text Case Converter workflow that shows how to make use of the library to make a script filter program for Alfred.

The library contains the Alfred class that has these class functions:

|Function|Description|
| --- | --- |
|public func Cache()| This returns the path to the cache information directory. |
|public func Data()| This returns the path to the data information directory. |
|public func Path()| This returns the path to the workflow directory. |
|public func Home()| This returns the path to the user's home directory.|
|public func ToXML()| This produces the XML output from using the AddResult function. This is for creating a script filter. |
|public func AddResult( uid: String, arg: String, title: String, sub: String, icon: String, valid: String, auto: String, rtype: String) | This adds a result to the XML list output. |
|public func SetDefaultString(title: String)| This sets a default string in case the results array is empty. |

The file compileSteps.md show how to compile the library and a program using it (tccconvert in this case). It assumes you have xCode 6 beta 6 installed.

# Text Case Converter in Swift

This workflow is a replication of my "tm:case" command of the Text Massager Workflow done in Swift. You have to have xCode 6 beta 4 to recompile the executable, but it should run on any system that is OS Maverick and up. Instructions for recompiling the Alfred Swift Library and the program is in the workflow directory. The one command is "tc:convert". The string given will be shown in capital case, upper case, lower case, and title case.

# Compiling

I have just updated the instructions in the file "compileSteps.md" to compile the code on a command line. It currently works with OS 10.10 Xcode Version 6.1 (6A1052d).

