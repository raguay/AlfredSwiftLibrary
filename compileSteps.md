Steps to Compile:
---

In the Terminal.app or iTerm.app program, run these command lines in the directory that contains the sources.

1. xcrun swiftc -emit-library -emit-object Alfred.swift -sdk $(xcrun --show-sdk-path --sdk macosx) -module-name Alfred

2. ar rcs libAlfred.a Alfred.o

3. xcrun swiftc -emit-module Alfred.swift -sdk $(xcrun --show-sdk-path --sdk macosx) -module-name Alfred

4. xcrun swiftc -o tcconverter -I "./" -L "./" -lAlfred -sdk $(xcrun --show-sdk-path --sdk macosx) tcconverter.swift

Once all four steps are ran, you will have the tcconverter program in that directory. If you change the tcconverter.swift code, you only have to re-run the last command. If you change the Alfred.swift code, you will have to re-run all four lines.

This currently works with xCode 6.1.
