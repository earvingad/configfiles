# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/earving/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bubblified"
# ZSH_THEME="bubblewritten"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

. "/home/earving/.cache/wal/colors.sh"

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/home/earving/.local/bin"
#:/bin:usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"


#completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# End of lines added by compinstall
# Alias
alias :q='exit'
# alias ls='ls --color=auto'
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
alias nm='neomutt'
alias emacs='emacs -nw'
alias systat='systemctl status'
alias systart='systemctl start'
alias pantalla='sh ~/.scripts/toggleHDMI.sh -h'
alias archstream='acestreamengine --client-console --port 8621'
alias urserver=' ~/urserver/urserver'
alias aceplayer='acestream-launcher' 
alias confqtile='nvim ~/.config/qtile/config.py'
alias doom='~/.emacs.d/bin/doom'
alias orgzly='./.scripts/orgzlydropbox.sh'
# Correction of commands
export SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color? [Y]es, [N]o, [A]bort, [E]dit "

# Avoid duplicate lines in history
setopt HIST_IGNORE_DUPS

#Keys
bindkey "\e[3~" delete-char	#Supr
bindkey "\e[8~" end-of-line	#Fin
bindkey "\e[7~" beginning-of-line #Inicio
bindkey "\e[5~" backward-word	#Re-pag
bindkey "\e[6~" forward-word	#Av-p
