updating pip packages might not work.
NTFS streams might be broken,  

using https://docs.microsoft.com/en-us/sysinternals/downloads/streams  
to clear them might help, it sometimes help with files downloaded from the internet that need to be unblocked.

setting the `--user` option for installations can not be done since this whole thing should be portable,  
and the `--user` command-line switch uses the user's own folder for storing stuff.. :|

setting the permission of the project folder (recursive) to everyone, and all users as suggested with:  
https://stackoverflow.com/questions/51912999/could-not-install-packages-due-to-an-environmenterror-winerror-5-access-is-de
does not seems to work,  
once packages were installed, overwriting them is hard.. but dependencies are not getting updated too much anyway.