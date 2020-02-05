#!/bin/zsh
## .zshrc
## Ugo Jardonnet

# import
source /etc/zsh_command_not_found

export LC_ALL=C

# History
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.history
chmod 600 ~/.history
setopt HIST_IGNORE_DUPS   # ignore consecutive dups in history
#setopt HIST_REDUCE_BLANKS # compact consecutive white space chars
setopt INC_APPEND_HISTORY # incrementally add items to HISTFILE
setopt SHARE_HISTORY      # share history between terminals

# Jobs
setopt nocheckjobs  # don't check processes when exiting
setopt nohup        # detach processes when exiting

# Prompt Options
setopt prompt_subst # allow prompt substitution
setopt promptcr # carriage return before prompt display

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt
autoload -U colors
colors
host_color="white"
path_color="green"
host="%{$fg[$host_color]%}%m"      # current host
cpath="%B%{$fg[$path_color]%}%c%b" # current dir
end="%{$reset_color%}"
PS1='$host : $cpath $(parse_git_branch)$ $end'
#PS2="--"
RPS1=$'%(?,%{\e[1;34m%}%B%T%b%{\e[0;0m%},%{\e[1;31m%}Err %?%{\e[0;0m%}) %B#%h%b'


# Environment
export MALLOC_OPTIONS='J'
export PAGER="less"
export EDITOR="emacs -nw"
export XTERM_OPTS="-T ${HOST}@${USER} -n ${HOST}@${USER} -ls"
export EDITOR='emacs'
export NNTPSERVER='news.epita.fr'
export SOCKS5_USER="$USER"
export SOCKS5_PASSWD='~/.socks'
#umask 077 # define new file rights

# Alias
alias ssh=autossh
compdef '_dispatch ssh ssh' autossh
alias h="history -f -D"
alias ls="ls -G --color"
alias l="\ls -lh --color"
alias la="\ls -lha --color"
alias grep='\grep -I --color=auto'
alias grepc='grep --exclude-dir CMakeFiles --exclude Makefile --exclude compile_commands.json -r .'
alias greps='grep --exclude-dir .svn '
alias rmc='rm *\~'
alias md5='openssl dgst -md5'
alias open='exo-open'
alias s="find . -path .svn -prune -o -print | grep "
alias ln_target_link="ln"
alias sshl="sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/config"

# Add D compiler path
export PATH=$PATH:$HOME/bin/dmd/bin/

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=5 #2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

# End of lines added by compinstall

# no beep
unsetopt beep
unsetopt hist_beep
unsetopt list_beep
unsetopt ignore_eof

backward-delete-char() {
    if [ "$BUFFER" = "" ]; then
        builtin cd ..
        zle .accept-line
    else
        zle .backward-delete-char
    fi
}
#zle -N backward-delete-char

# Bindings
#=========

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

for k in ${(k)key} ; do
    # $terminfo[] entries are weird in ncurses application mode...
    [[ ${key[$k]} == $'\eO'* ]] && key[$k]=${key[$k]/O/[}
done
unset k

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
# FIXME: valid for xterm
#bindkey '^[[H' beginning-of-line                 # Home
#bindkey '^[[F' end-of-line                       # End
#bindkey '^D'   delete-char                       # Del
#bindkey '^?'   my-delete-char                    # backspace
bindkey ";5A"  history-beginning-search-backward # C-Up
bindkey ";5B"  history-beginning-search-forward  # C-Dn
bindkey ';5D'  backward-word                     # C-Left
bindkey ';5C'  forward-word                      # C-Right

# Other
# =====

# list files when entering a directory
cd()
{
    builtin cd "$@"; echo $PWD; l | head -30; \
        [ `\ls -1|wc -l` -gt 30 ] &&          \
        echo "...$fg[red]*$reset_color"; true
}
setopt auto_cd

# Set window title to the last command
case $TERM in
    rxvt|*term|linux)
        preexec () { print -Pn "\e]0;zsh: $1\a" }
        ;;
esac


# ZLE functions
#==============

# Highlight the command line
syntax-highlight() {
    repeat $#LBUFFER echo -n "\b"
    #if [[ $#LBUFFER != 0 ]]; then
    #    echo -n "\e[${#LBUFFER}D"
    #fi
    #echo $BUFFERLINES
    #BLINES=$(( ${BUFFERLINES} - 1))
    #if [[ $BLINES != 0 ]]; then
    #    echo -n "\e[${BLINES}A"
    #fi
    #repeat $BUFFERLINES echo -n "\e[A"
    #repeat $#PS1 echo -n "\e[C"
    echo -n "$(source-highlight -s Shell -f esc <<< "$LBUFFER")"
}
zle -N syntax-highlight

# Highlight when accept line
accept-line() {
    zle syntax-highlight
    zle .accept-line
}
#zle -N accept-line

# Highlight on the left when char insertion
self-insert () {
    zle syntax-highlight
    zle .self-insert
}
#zle -N self-insert

source /etc/environment

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.cask/bin/"
export PATH="$PATH:$HOME/dev/rtags/bin"
export PATH="$PATH:$HOME/.local/bin"

export FZF_DEFAULT_OPTS="-e"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:/home/ugo/clion-2016.2.2/bin"

#   for PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

git-amend-to() (
  # Stash, apply to past commit, and rebase the current branch on to of the result.
  current_branch="$(git rev-parse --abbrev-ref HEAD)"
  apply_to="$1"
  git stash
  git checkout "$apply_to"
  git stash apply
  git add -u
  git commit --amend --no-edit
  new_sha="$(git log --format="%H" -n 1)"
  git checkout "$current_branch"
  git rebase --onto "$new_sha" "$apply_to"
)

export KUBECONFIG=/home/ugo/.kube/kubeconfig-savant.yaml
alias pods='kubectl get pods '
alias ktops='kubectl top pods '
alias kexec='kubectl exec -it '
alias klogs='kubectl logs '
