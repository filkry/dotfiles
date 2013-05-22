if [ -x /usr/local/bin/gdircolors ]; then
	test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
	alias ls='gls -F --color=auto'
	alias grep='grep --color=auto'
fi

# Use homebrew python if it exists
export PATH=/usr/local/share/python:$PATH
