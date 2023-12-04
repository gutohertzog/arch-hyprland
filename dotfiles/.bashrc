#
# ~/.bashrc
#

# If not running interactively, don"t do anything
[[ $- != *i* ]] && return

# atalhos dos comandos
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias bateria="cat /sys/class/power_supply/BAT0/capacity" # porcentagem bateria

# para ser executado ao se abrir um novo terminal
neofetch

# adiciona o Neovim como editor padrão do sudo
export VISUAL="nvim"
export EDITOR="$VISUAL"

# criação do PS1
texto="\[\e[38;5;3m\][\t] \[\033[0m\]" # adiciona hora
texto="$texto\[\e[38;5;2m\]\w\[\033[0m\]\n" # adiciona o caminho completo
texto="$texto\[\e[38;5;250m\]\u@\h \[\033[0m\]\$ " # linha terminal final usuário@máquina

PS1=$texto
