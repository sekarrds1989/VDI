# VDI
Work environment setup

Following are majorly needed configs. I've highlighted few of the notable properties supported.
Each line has appropriate comment added to explain its behavior

## vimrc: 
- Configure appropriate path for "backupdir".
- Open Vim on some file and Run PlugInstall to install all required plugin's. 
- you will get "GTAGS not found." error whenever a file is opened from a non-gtags enabled folder.
### Imp Shortcuts:
#### gtags browsing:
shortcuts | action
----------|-------
C-]     | Jump to definition of tag under cursor
C-d     |   Jump back to last tag
C-r     |   List all references
\       |   Leader key ( used to define more shortcuts)
\nt     |   Toggle NerdTree
\t      |   Toggle Tagbar
Space   |   Start command bar with colon
\l      |   Toggle vim Locationlist
\q      |   Toggle vim quicklist <br> quicklist can be used to process bash console output to parse thru each files output. <br> ex: <br> 1) grep for a string in a folder <br> 2) open vim <br> 3) open quicklist <br> 4) you will see all grep results here. now you can move thru them and jump to that file directly
\p      |   :set paste
\o      |   :set nopaste
\[      |   open folds
\]      |   close folds

#### vim cmd bar
commands | action
----------|-------
cs f s "str" | Find all refrences of given string
cs           | List all possiblities of cscope



## bashrc:
 - PS promt will display last 3 parent folders.
 - backward history search support using up arrow-keys enabled 
### Imp Shortcuts:
alltags     -   build all tags (gtags and cscope)
                cscope is needed for gtags-cscope integration
                
check alias file for more details

## tmux.conf:
 - very minimal and needed configs added.
 - comment added for each block
### Imp Shortcuts:
shortcuts | action
----------|-------
C-aC-a      |   switch between windows
C-a[Num]    |   Jump to window-Num

## putty-manager:

Putty-manager i use nd-putty , simple and effective. remeber to set terminal type.
https://superuser.com/questions/94436/how-to-configure-putty-so-that-home-end-pgup-pgdn-work-properly-in-bash
