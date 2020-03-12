# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jzb"
#ZSH_THEME="aussiegeek"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(common-aliases git repo tmux cp sublime zsh-syntax-highlighting zsh-history-substring-search fancy-ctrl-z)

source ~/.profile
source $ZSH/oh-my-zsh.sh
#ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow'
#ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'

# User configuration

#export PATH="/home/jzb/bin:/home/jzb/bin:/home/jzb/bin/jdk1.6.0_24/bin:/usr/share/ant/bin:/home/jzb/bin:/home/jzb/bin/jdk1.6.0_24/bin:/usr/share/ant/bin:/home/jzb/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jzb/acs/:/home/jzb/bin/adt-bundle-linux-x86_64-20130917/sdk/tools/:/home/jzb/acs/:/home/jzb/bin/adt-bundle-linux-x86_64-20130917/sdk/tools/"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#export TERM=screen-256color
export TERM=xterm-256color
#export DISPLAY=":0.0"
export EDITOR='vim'

if [ -x "/usr/bin/vimmanpager" ] ; then
  export MANPAGER="vimmanpager -R -c 'set background=back'"
fi

alias df='df -h'
alias du='du -sh'
alias tmux='tmux -2'
alias -g gp='| grep -i'
alias ff='find . -iname'
alias ll='ls -alF'
alias rgrep='grep -rn --color=auto'
#disable -r time       # disable shell reserved word
#alias time='time -p ' # -p for POSIX output
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'


# Workarounds for https certificate issues
#alias wget='wget --no-check-certificate'
#alias curl='curl -k'

alias fg1='fg %1'
alias fg2='fg %2'
alias fg3='fg %3'
alias fg4='fg %4'
alias fg5='fg %5'
alias fg6='fg %6'
alias fg7='fg %7'
alias fg8='fg %8'
alias fg9='fg %9'
alias fg10='fg %10'

#man() {
	#env \
			#LESS_TERMCAP_mb=$(printf "\e[1;37m") \
			#LESS_TERMCAP_md=$(printf "\e[1;37m") \
			#LESS_TERMCAP_me=$(printf "\e[0m") \
			#LESS_TERMCAP_se=$(printf "\e[0m") \
			#LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
			#LESS_TERMCAP_ue=$(printf "\e[0m") \
			#LESS_TERMCAP_us=$(printf "\e[0;36m") \
					#man "$@"
#}
#
# cdargs config
function cv () {
	cdargs "$1" && cd "`cat "$HOME/.cdargsresult"`" ;
}

function ca () {
	cdargs --add=":$1:`pwd`" ;
}

setopt   nonomatch
unsetopt share_history
HISTSIZE=10000
SAVEHIST=10000

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys
# for Ubuntu
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/lib/ccache/bin:${PATH}" # Enable CCACHE
#export CURL_CA_BUNDLE="$HOME/.dotfiles/certificate/cacert.pem"

# load $HOME/autoload.d/*.sh
if [ -d "$HOME/autoload.d" ] ; then
	for sh in $HOME/autoload.d/*.sh ; do
		[ -r "$sh" ] && . "$sh"
	done
	unset sh
fi
