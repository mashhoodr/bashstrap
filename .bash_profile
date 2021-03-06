### Personal configurations

# Android development
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
export ANDROID_HOME="/Applications/Android/sdk"
export PATH=$ANDROID_HOME/platform-tools:$PATH
export NEXUS="0179f47c1fd116a1"
export QMOBILE="ZPPZ4SNRW8GYSSHA"
export ANDROID="$HOME/Developer/JAVA/Android"

# For Prodo
alias prodo='cd ~/Dropbox/snuke/prodo/prodo-web'

# Configurations for current tipgain projects
export TIPDIR=~/Developer/Scala/tipgain
alias tpg='cd $TIPDIR/aft-backend;play run;'
alias tpd='cd $TIPDIR/aft-devices;play "run 9009";'
alias tpt='cd $TIPDIR/aft-testing;play "run 10532";'
alias tt='cd $TIPDIR;'
# export ENV="STAGING"
export BACKEND_SERVER_HOST_URL="http://localhost:9000"
export BACKEND_SERVER_USER_ID="51900a2e300445aa550657bf"
export BACKEND_SERVER_ORGANISATION_ID="51900a2e300445aa550657be"
export BACKEND_SERVER_APP_ID="51900a2f300445aa550657c0"


### Aliases

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias ll="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts to my Code folder in my home directory
alias code="cd ~/Developer"
alias sites="cd ~/Sites"
alias home='cd ~'
alias unhide='defaults write com.apple.finder  AppleShowAllFiles -bool true;killall Finder;'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false;killall Finder;'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Git
# You must install Git first - ""
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'


### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
	else
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	BLACK="\033[01;30m"
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="☁  "

export PS1="\[${BOLD}${GREEN}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\n\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
. ~/z.sh
