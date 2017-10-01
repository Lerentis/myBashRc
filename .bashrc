#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

source $HOME/.shells/functions
source $HOME/.shells/exports
source $HOME/.shells/alias

color_my_prompt

screenfo

#Greeting
echo -ne "Good Day,"; whoami;
echo -ne "It's "; date

#Fuck
eval $(thefuck --alias)
