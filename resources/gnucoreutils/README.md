(about:  https://www.gnu.org/software/coreutils/)

from:  
https://github.com/git-for-windows/git/releases  
https://github.com/git-for-windows/git/releases/tag/v2.37.0.windows.1  
https://github.com/git-for-windows/git/releases/download/v2.37.0.windows.1/PortableGit-2.37.0-64-bit.7z.exe  

`PortableGit-2.37.0-64-bit.7z.exe\usr\bin\`

note: old builds had `msys-gcc_s-1.dll`, it is now called `msys-gcc_s-seh-1.dll`.

<hr/>

external side-by-side manifest only,  
since embedding it in dlls breaks the dlls,  
no large-allocation-aware patch.

upx compressed with `--force` to allow compression of `writable shared sections`  
(normally are not supported), it works fine.  
