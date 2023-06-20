# VDI
Work environment setup

Clone this repo to a directory.
Run "setup.sh" to setup your work env

I've highlighted few of the notable properties for each of the file and added comments as much as possible.


## vimrc: 
- set env variable, VIM_BKUP=<absolute path>, this is the place where all vim bkup and undo files will be stored
- copy the autoload folder into your ~/.vim/
- copy the colors folder into your ~/.vim/
- Open Vim on some file and Run PlugInstall to install all required plugin's. 
Known errors:
- you will get "GTAGS not found." error whenever a file is opened from a non-gtags enabled folder.
### Imp Shortcuts:
#### gtags browsing:
shortcuts | action
----------|-------
**C-]**     | Jump to definition of tag under cursor
C-d     |   Jump back to last tag
C-r     |   List all references
\       |   Leader key ( used to define more shortcuts)
**\nt**     |   Toggle NerdTree**
**\t**      |   Toggle Tagbar**
Space   |   Start command bar with colon
\l      |   Toggle vim Locationlist
\q      |   Toggle vim quicklist <br> quicklist can be used to process bash console output to parse thru each files output. <br> ex: <br> 1) grep for a string in a folder <br> 2) open vim <br> 3) open quicklist <br> 4) you will see all grep results here. now you can move thru them and jump to that file directly
\[      |   open folds
\]      |   close folds
**\a**      |   launch ack.vim search , if pressed enter without any input , searchs for the word under the cursor  and populates quicklist
**\f**      |   launch fuzzy search
\m      |   highlight the word under cursor with a different color
\b      |   navigate in vim buffers
\bn     |   next vim buffer
\bp     |   prev vim buffer
C-n     |   navigate in quicklist next 
C-p     |   navigate in quicklist prev
F2      |   toggle paste mode
F3      |   Navigate saved cursor positions (old) 
F4      |   Navigate saved cursor positions (latest)
F11     |   navigate location list (prev)
F12     |   navigate location list (next)

#### vim cmd bar
commands | action
----------|-------
cs f s "str" | Find all refrences of given string
cs           | List all possiblities of cscope



## bashrc:
 - PS promt will display last 3 parent folders.
 - backward history search support using up arrow-keys enabled 
### Imp Shortcuts:
commands | action
----------|-------
alltags          |   build all tags (gtags and cscope), cscope is needed for gtags-cscope integration
vim -t tag-name |   open the file having this tag
                
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
