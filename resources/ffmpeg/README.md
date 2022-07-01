from:  
https://github.com/nanake/ffmpeg-tinderbox/releases
https://github.com/nanake/ffmpeg-tinderbox/releases/tag/build-2022-06-30-21-29-n107281
https://github.com/nanake/ffmpeg-tinderbox/releases/download/build-2022-06-30-21-29-n107281/ffmpeg-N-107281-git-e4be88704f-win64-nonfree-shared.7z

based on:  
https://github.com/FFmpeg/FFmpeg/commit/e4be88704f  

manifest patched,  
large address aware patch,  
upx compressed.

<hr/>

thanks to https://github.com/nanake/ffmpeg-tinderbox/issues/2  
there is a shared build, meaning the logic (~60MB) is in the dll files,  
while ffmpeg and ffprobe are about ~150KB.

<hr/>

ffplay is included even though it is not needed since the shared-build has the logic in the dll files,  
and the exe are very small.
