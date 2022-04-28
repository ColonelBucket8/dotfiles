#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set vim as default text editor
export VISUAL=vim
export EDITOR="%VISUAL"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias music='ncmpcpp'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# PS1='[\u@\h \W]\$ '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

export PS1="${red}\u${grn}@${red}\h ${grn}\w${ylw}\$(parse_git_branch)${clr} $ "

#export PS1="${cyn}\u${grn}@${cyn}\h ${grn}\w\[\033[33m\]\$(parse_git_branch)${clr} $ "
