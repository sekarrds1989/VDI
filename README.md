# VDI
Work environment setup

Following are majorly needed configs. I've highlighted few of the notable properties supported.
Each line has appropriate comment added to explain its behavior

## vimrc: 
- Configure appropriate path for "backupdir".
- Open Vim on some file and Run PlugInstall to install all required plugin's. 
- you will get "GTAGS not found." error whenever a file is opened from a non-gtags enabled folder.

## bashrc:
 - PS promt will display last 3 parent folders.
 - backward history search support using up arrow-keys enabled 

## tmux.conf:
 - very minimal and needed configs added.
 - comment added for each block

## putty-manager:

Putty-manager i use nd-putty , simple and effective. remeber to set terminal type.
https://superuser.com/questions/94436/how-to-configure-putty-so-that-home-end-pgup-pgdn-work-properly-in-bash
