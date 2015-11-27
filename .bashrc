#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.shells/functions
source $HOME/.shells/exports
source $HOME/.shells/alias

PS1='[\u@\h \W]\$ '
archey3

#Greeting
echo -ne "Good Day,"; w -hs | cut -d " " -f1 | sort | uniq; 
echo -ne "It's "; date '+%A, %B %-d %Y'
echo -e "The Weather today:"; 
weather-report -m "51.4508,7.0131"
