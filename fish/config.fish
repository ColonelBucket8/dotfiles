if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias music='ncmpcpp'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ncspot='~/code/bin/ncspot'
alias ncspot-build='cargo build --release --features cover'
alias ytfzf='ytfzf -t'
alias vim='nvim'
alias fix-hotspot='sudo modprobe 88x2bu; sudo modprobe cfg80211'

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden"
set -gx VISUAL nvim 
set -gx EDITOR nvim

