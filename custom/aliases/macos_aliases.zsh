#!/usr/bin/env zsh

alias os="echo $(uname -sro)"

alias whichAlias="echo $MACOS_ALIASES"

alias eless='ls -A -sS -p -h -gG --color'
alias ls='ls --color -hA -p'
# format when...
alias lsF='ls -F '
#
alias lsa1='ls -A1'
# sort
alias lst='ls -t'
alias lsv='ls -v'
alias lstc='ls -tc'
alias lstC='ls -t --time=creation'
alias lsS='ls -S'
alias lsX='ls -X'
# reverse sort
alias lsrt='lst -r'
alias lsrc='lsc -r'
alias lsrtc='lstc -r'
alias lsrtC='lstC -r'
alias lsrv='lsv -r'
alias lsrS='lsS -r'
alias lsrX='lsX -r'
# output format
alias lsacross='ls -x'
alias lscomma='ls -m'
alias lscol='ls -C'
alias lsdir='ls -d'
#
alias lsdot='ls -d .* '
alias lsR='ls -R'
alias lsplain='ls --color=never'
# detailed
alias lgs='ls -og'
alias lls='ls -l'
alias llsdots='ll -d .*'
alias llsR='ll -R'
alias llst='ll -t'
alias lsShort="alias | grep \"ls\""

alias clip="pbcopy $1"
alias copyToClip="echo \"renamed to 'clip'\" | clip"
# alias fromClip="xclip -o -selection clipboard && echo "

# SUBLIME TEXT
# alias subl="/opt/sublime_text/sublime_text --launch-or-new-window "
# sublime_text [arguments] -               Edit stdin
# alias sublStdIn="/opt/sublime_text/sublime_text -n - "
# sublime_text [arguments] - >out          Edit stdin and write the edit to stdout
# alias sublStdIn2Out="/opt/sublime_text/sublime_text -n - >out "
