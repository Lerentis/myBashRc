#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.shells/functions
source $HOME/.shells/exports
source $HOME/.shells/alias

PS1='[\u@\h \W]\$ '
archey

#Greeting
echo -ne "Good Day,"; w -hs | cut -d " " -f1 | sort | uniq; 
echo -ne "It's "; date '+%A, %B %-d %Y'
echo -e "And now listen to the cow:"; 
cowsay $(fortune);