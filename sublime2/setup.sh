#!/bin/sh
# Setup a machine for Sublime Text 2
# Need this because files are stored in inconsistent locations between OSs

# symlink settings in
sublime_dir='nothing'

if [[ "$OSTYPE" =~ ^darwin ]]; then
    sublime_dir=~/Library/Application\ Support/Sublime\ Text\ 2/Packages
elif [[ "$(cat /etc/issue 2> /dev/null)" =~ .*Arch.* ]]; then
    # TODO
    sublime_dir=~/Library/Application\ Support/Sublime\ Text\ 2/Packages
fi

mv "$sublime_dir/User" "$sublime_dir/User.backup"
ln -s "$ZSH/sublime2/User" "$sublime_dir"

