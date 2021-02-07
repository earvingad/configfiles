#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='  \e[1m\u \e[38;5;47;1m\w\e[m
     \e[38;5;2;1m└───────➤ \e[m'
