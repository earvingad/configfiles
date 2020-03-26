# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch correct
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/earving/.zshrc'

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

#completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# End of lines added by compinstall

# Alias
alias :q='exit'
alias ls='ls --color=auto'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias seekpkg='pacman -Q | grep'
alias update='pikaur -Syu'
alias myip='ip address | grep wlp1s0 | grep inet | cut -d " " -f6 | cut -d "/" -f1'
alias boot='systemd-analyze'
alias red='netctl start'
alias home='netctl start INFINITUMduse && privoxy --no-daemon /etc/privoxy/config'
alias torset='sh /home/earving/.scripts/torset.sh -c'
alias appoint='sudo create_ap wlp1s0 wlp1s0 EAD a1234567'
alias confi3='nvim ~/.config/i3/config'
alias bloconf='nvim ~/.config/i3/i3blocks.conf'
alias zshrc='nvim .zshrc'
alias confpoly='nvim ~/.config/polybar/config'
alias confsxhdrc='nvim /home/earving/.config/sxhkd/sxhkdrc'
alias confbspwm='nvim ~/.config/bspwm/bspwmrc'
alias confrules='nvim ~/.config/bspwm/external-rules.sh'
alias confvim='nvim ~/.config/nvim/init.vim'
alias nv='nvim'
#alias emacs='emacs -nw'
alias systat='systemctl status'
alias systart='systemctl start'
alias pantalla='sh ~/.scripts/toggleHDMI.sh -h'
alias archstream='acestreamengine --client-console --port 8621'
alias urserver=' ~/urserver/urserver'
alias aceplayer='acestream-launcher' 
#alias neofetch='neofetch --ascii_distro arch_n' 
alias dic='dict -d fd-fra-eng' 

#Pompt
autoload -Uz colors && colors
PROMPT="%{$fg_bold[white]%}  %n%{$reset_color%} %{$fg_bold[cyan]%}%~ %{$reset_color%}%

%{$fg_bold[green]%}     └───────➤%{$reset_color%} "
RPROMPT="%T"

# Correction of commands
export SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color? [Y]es, [N]o, [A]bort, [E]dit "

# Avoid duplicate lines in history
setopt HIST_IGNORE_DUPS

#Keys
bindkey "\e[3~" delete-char	#Supr
bindkey "\e[8~" end-of-line	#Fin
bindkey "\e[7~" beginning-of-line #Inicio
bindkey "\e[5~" backward-word	#Re-pag
bindkey "\e[6~" forward-word	#Av-pag

#History search
[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
