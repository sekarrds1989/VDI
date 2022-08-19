#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command returned exit code $?."' EXIT

#directory for backup
mkdir -p ~/.vim/bkup
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/plugged

mkdir -p bkup
#copy vimrc 
cp -i ~/.vimrc bkup/
cp vimrc ~/.vimrc

#Autoload and colors for vim
cp -rf autoload ~/.vim/
cp -rf colors ~/.vim/
cp gtags-cscope.vim ~/.vim/plugged/

cp -i ~/.bashrc bkup/
cp -i ~/.bash_aliases bkup/

# below given hack is needed for intel work environment
_user="$(id -u -n)"

cp bashrc ~/.bash_$_user
cp bash_aliases ~/.bash_aliases

echo "#!/bin/bash" > ~/.bashrc.$_user
echo ". ~/.bash_$_user" >> ~/.bashrc.$_user
echo ". ~/.bash_aliases" >>  ~/.bashrc.$_user


vim +'PlugInstall --sync' +qa


