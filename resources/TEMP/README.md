I've set the "kit" to override the `%TEMP%` and `%TMP%` environment settings of the operation-system to this folder,  
just as long the scripts runs. various temp. files will be written here, including the archives of pip-managed packages  
(when updating core packages or yt-dlp dependencies, for example),  
it makes debugging easier since you don't have to look around the mess of the real temp. folder,  
and it also keeps the program from dumping stuff into the computer you run on.

you can safely delete every file in this folder (even this README.md file, if you don't need it anymore).
