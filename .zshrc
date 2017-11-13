# Created by newuser for 5.4.2
ZSH_THEME="tonotdo"
source ~/.shells/alias
source ~/.shells/functions
source ~/.shells/exports
#Prompt
setopt prompt_subst
autoload -Uz colors && colors
autoload -U compinit && compinit

fg_alert=%{$'\e[38;5;161m'%}
at_normal=%{$'\e[0m'%}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "[ %{$fg[magenta]%}virt:%{$reset_color%} "$(basename $VIRTUAL_ENV)" ] "
}

GIT_PROMPT_SYMBOL="%{$fg[green]%}git:"
GIT_PROMPT_CLEAN="%{$fg_bold[green]%}-"
GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}> NUM"
GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}< NUM"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}Y"
GIT_PROMPT_UNTRACKED="${fg_alert}!"
GIT_PROMPT_MODIFIED="${fg_alert}+"
GIT_PROMPT_STAGED="%{$fg_bold[blue]%}="

function parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}
GIT_PROMPT_SYMBOL="%{$fg[green]%}git:"
GIT_PROMPT_CLEAN="%{$fg_bold[green]%}-"
GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}> NUM"
GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}< NUM"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}Y"
GIT_PROMPT_UNTRACKED="${fg_alert}!"
GIT_PROMPT_MODIFIED="${fg_alert}+"
GIT_PROMPT_STAGED="%{$fg_bold[blue]%}="

function parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}
function parse_git_state() {
    local GIT_STATE=""
    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_AHEAD" -gt 0 ]; then
            GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
        fi
    local NUM_BEHIND="$(git log --oneline lerentis@burntbunch.org{u} 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_BEHIND" -gt 0 ]; then
            GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
        fi
    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
        if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
            GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
        fi
    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi
    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi
    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi
    if [ -z "$(git status --porcelain)" ]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_CLEAN
    fi
    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_STATE"
    fi
}
function git_prompt_string() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "[ $GIT_PROMPT_SYMBOL %{$reset_color%}${git_where#(refs/heads/|tags/)} $(parse_git_state)%{$reset_color%} ] "
}

PROMPT='%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m %{$fg_bold[blue]%}%4~%{$reset_color%} $(git_prompt_string)$(virtualenv_info)> '
RPROMPT="%* [%{$fg_no_bold[green]%}%?%{$reset_color%}]"
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[3~" delete-char

SAVEHIST=50
HISTFILE=~/.zsh_history


screenfo

#Greeting
echo -ne "Good Day,"; whoami; 
echo -ne "It's "; date

#Fuck
eval $(thefuck --alias)
