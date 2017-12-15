# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#JAVA_1_6=$HOME/bin/jdk1.6.0_45
#JAVA_1_7=$HOME/bin/jdk1.7.0_25
JAVA_OPENJDK=/usr/lib/jvm/icedtea-bin-8
#JAVA_HOME=$JAVA_1_6
export JAVA_HOME=$JAVA_OPENJDK
export JAVA_FONTS=/usr/share/fonts/truetype
export no_proxy=localhost,127.0.0.1,.intel.com,10.0.0.0/8
export CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#export CLASSPATH=.
export ANT_HOME=$HOME/bin/apache-ant-1.9.4
PATH=$HOME/bin:$JAVA_HOME/bin/:$ANT_HOME/bin:$PATH
#PATH=$HOME/bin:$ANT_HOME/bin:$PATH

#export GTK_PATH=/usr/lib32/gtk-2.0

#sshfs zhebin@graphics-srv2:src/ ~/server/
#export TERM=screen-256color
#source ~/.local/bin/bashmarks.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/lib/ccache/bin:${PATH}" # Enable CCACHE

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
# This loads RVM into a shell session.
