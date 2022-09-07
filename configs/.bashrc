#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ `tty` != *"/dev/tty"* ]] && [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session;}

# PS1='[\u@\h \W]\$ '
PS1='[\W] > '

n(){
	# Block nesting of nnn in subshells
	if [[ "${NNNLVL:-0}" -ge 1 ]]; then
		echo "nnn is already running"
		return
	fi

	# The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
	# If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
	# see. To cd on quit only on ^G, remove the "export" and make sure not to
	# use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
	#     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

	# Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
	# stty start undef
	# stty stop undef
	# stty lwrap undef
	# stty lnext undef

	nnn -Read "$@"

	if [ -f "$NNN_TMPFILE" ]; then
		. "$NNN_TMPFILE"
		rm -f "$NNN_TMPFILE" > /dev/null
	fi
}

export DOTDIR=~/Documents/dotfiles
export FZF_DEFAULT_COMMAND="find"

export EDITOR=vim
export NNN_BMS='b:bookmarks;p:~/Pictures;d:~/Downloads;c:~/.config;D:~/Documents;v:~/Videos'
export NNN_PLUG='f:fzcd;o:fzopen;p:preview-tui;i:imgview'
export NNN_FCOLORS='8D8D8D8D8D8D8D8D8D8D8D8D'
export NNN_COLORS='#8D8D8D8D8D'

alias ls='ls --color=auto'
alias nnn='nnn -Read'
alias cl='clear'
