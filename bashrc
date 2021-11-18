# .bash_profile
if [[ $BASH_PROFILE_RUNNING_ALREADY != yes ]]; then
        BASH_PROFILE_RUNNING_ALREADY=yes;
else
        return;
fi
# If not running interactively, don't do anything
if [[ $- != *i* ]]; then return; fi

# User specific environment and startup programs

alias tags='ctags -R -f tags '

function v()
{
        if [ $1 -a -L $1 ];then
                vim $(readlink -e $1)
                return;
        fi
        vim $@
}
#alias v="vim"
alias vi="vim"
alias vd="vimdiff"

alias grep='grep -sE '
alias grepc='grep -sE --color=always '
#alias xgrep='parallel -j4 grep -sE --color=always '
alias xgrep='xargs grep -sE '
alias xgrepc='xargs grep -sE --color=always '
function _f(){ p=$1; shift; find $p -type f $* ; set glob; };
alias f="set noglob; _f"
alias h=history

alias ls="ls --color=auto -p"
alias ll="ls -l"
alias la="ls -al"
alias ltr="ls -ltr"
alias l="ls --color=auto --format=horizontal -XF "

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LANGUAGE=en_US.UTF-8

function VGtags()
{
#echo vim -c ":Gtags $1 $2"
        if [[ $# -le 1 ]]
        then
                return
        fi
        file=$2
        if [[ $1 = "p" ]]
        then
                declare -a filename_lineno=($(echo $2 | tr "[: ]" " "))
                file="${filename_lineno[0]}"
        fi

        :> ~/.vim/tmp/vfiles.txt
        vim -c ":call Gtags_$1(\"$file\")"
        . ~/.vim/tmp/vfiles.txt
}



alias p="VGtags p"
alias x="VGtags x"
alias cx="VGtags cx"
alias d="VGtags dx"
alias c="VGtags c"
alias r="VGtags r"
alias s="VGtags s"
alias g="VGtags g"
alias DIFF="DiffFiles "


STARTFGCOLOR='\e[0;34m';
STARTBGCOLOR="\e[47m"
ENDCOLOR="\e[0m"
# export PS1="$STARTFGCOLOR$STARTBGCOLOR[\u::\W] $ENDCOLOR"
# export PS1='\[\e[0;38;5;166m\]\w\[\e[0m\] $ '
# export PS1='\[\e[0;38;5;166m\][${PWD#${PWD%/*/*/*}/}]\[\e[0m\] $ '
# without color
export PS1='[${PWD#${PWD%/*/*/*}/}]\$ '



set -o vi
set editing-mode vi
set keymap vi
set convert-meta on
set bell-style none

addalias() {
        echo "alias "$1"=\""$2"\"" >> ~/.bash_aliases
}

cd(){
        dir=$1;
#to_dir="$(echo echo ${!dir} |sh )"
#echo "${to_dir}, ${dir}, ${!dir}"

        if [[ $# -eq 0 ]]; then
                builtin cd $HOME;
        elif [[ "$dir" == "-" ]]; then
                builtin cd -
                elif [[ -d ${dir} ]]; then
                builtin cd $dir;
        elif [[ -d ${to_dir} ]]; then
                builtin cd $to_dir;
        elif [[ "${dir}" = "base" ]]; then
                builtin cd "${!dir}" ;
        else
                builtin cd "${dir}" ;
        fi ;
#echo -e "[${PWD}]";
#echo -ne "\033]0;${HOST}: ${PWD}\007";
#echo "${PWD}" > ${HOME}/.screen_pwd_${STY#*.}
}

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#bind '"\t":menu-complete'
bind -m vi-insert "\C-p":dynamic-complete-history
bind -m vi-insert "\C-n":menu-complete
bind -m vi-insert "\C-l":clear-screen
#bind -m vi-insert '" "':menu-complete


export EDITOR=vim
export PROMPT_COMMAND=""
export PROMPT_COMMAND="$PROMPT_COMMAND history -a "
export HISTFILESIZE=9999999999 # the bash history should save 3000 commands
export HISTSIZE=99999999999

export HISTIGNORE="pwd:ls:dir"
#export HISTCONTROL=ignorespace:erasedups
export HISTCONTROL=erasedups
export HISTFILE=~/.bash_history
#export HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT=' '
shopt -s histappend
shopt -s cmdhist
shopt -s expand_aliases

#Set up history size unlimited
#unset HISTSIZE
#unset HISTFILESIZE
shopt -s histappend

#shopt -s failglob
#shopt -s nullglob
#shopt -s direxpand


# Define a few Color's
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m' # No Color


function ps1()
{
        export PS1="[\`pwd\`]"
}



#single tab completion
set show-all-if-ambiguous on
set completion-query-items 3500
set completion-ignore-case on

#default permision
umask 0000

rm -rf ~/.vim/tmp/*

LS_COLORS='di=38;5;33:fi=38;5;124:ln=38;5;127:pi=33:so=35:bd=36:cd=37:or=37:mi=30:ex=32:*.rpm=90'
export LS_COLORS


function cwd()
{
        return "$(pwd)"
}

#ESC timeout
set keyseq-timeout 0

# https://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode/41626377
alias tmux="TERM=screen-256color-bce tmux"

touch ~/.custom_profile
touch ~/.custom_vimrc
. ~/.custom_profile

if [ -s ~/.bashrc ]; then
        source ~/.bashrc;
fi
