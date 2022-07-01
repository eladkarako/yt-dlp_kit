https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.5.0-beta2-windows.zip

<hr/>

used to retrive cookies, DOM-rendered HTML,  
the project was not maintained since 2017,  
its core rendering/DOM/javascript/CSS engine is very out of date,  
and usually a better choice is to use "headless browser",  
but it is still useful for simple websites,  
there are very few extractors in yt-dlp that actually uses phantomjs (currently just two).

<hr/>

the latest available version.
it is a x64 build, there are no (recent) x86 builds available.

attempts to un-upx( https://github.com/upx/upx/releases ) it - currupted the binary file,  
so it is provided as is.

upx-compressed exe files can not be manifest patched,  
otherwise it will corrupt the binary file,  
so an external (side-by-side) manifest is provided:  


```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?> 
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0"> 
  <dependency optional="yes"> 
    <dependentAssembly> 
      <assemblyIdentity name="Microsoft.Windows.Common-Controls" 
        version="6.0.0.0" publicKeyToken="6595b64144ccf1df" 
        type="win32" processorArchitecture="*" language="*" /> 
    </dependentAssembly> 
  </dependency> 
  <application xmlns="urn:schemas-microsoft-com:asm.v3"> 
     <windowsSettings> <dpiAware      xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">true/PM</dpiAware>                     </windowsSettings> 
     <windowsSettings> <dpiAwareness  xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">PerMonitorV2,PerMonitor</dpiAwareness> </windowsSettings> 
     <windowsSettings> <longPathAware xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">true</longPathAware>                   </windowsSettings> 
     <windowsSettings> <heapType      xmlns="http://schemas.microsoft.com/SMI/2020/WindowsSettings">SegmentHeap</heapType>                 </windowsSettings> 
  </application> 
  <trustInfo xmlns="urn:schemas-microsoft-com:asm.v3"> 
    <security> 
      <requestedPrivileges> 
        <requestedExecutionLevel level="asInvoker" uiAccess="false" /> 
      </requestedPrivileges> 
    </security> 
  </trustInfo> 
  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1"> 
    <application> 
      <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" /> 
      <supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}" /> 
      <supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}" /> 
      <supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}" /> 
      <supportedOS Id="{e2011457-1546-43c5-a5fe-008deee3d3f0}" /> 
    </application> 
  </compatibility> 
</assembly> 
 
```

