#!/usr/bin/env bash

alias os="echo $(uname -sro)"

# alias whichAlias="echo common_aliases"

# spaces on ends are intentional in case need sudo at the front and to add the search term at the end
alias searchAPTByName=' apt search --names-only '

# alias python=python3
alias zoursh="source ~/.zshrc"
# alias mai="conda activate music-reco"
alias condact="conda activate "

alias magick="convert"
alias magickAnimate="animate"
alias magickConjure="conjure"
alias magickComposite="composite"
alias magickDisplay="display"
alias magickIdentify="identify"
alias magickImport="import"
alias magickMogrify="mogrify"
alias magickMontage="montage"
alias magickStream="stream"

# alias ink="~/inkscape/squashfs-root/AppRun"
# alias inkview="ink inkview"

alias nrd="npm run dev"
alias yarndk='yarn dlx @yarnpkg/sdks vscode'
alias yarnOn="corepack enable && yarn set version stable --only-if-needed"
alias ncuu="npx npm-check-updates -u"
alias ncu="npx npm-check-updates"
alias pn="pnpm"

alias aptUpgrade='sudo apt update && sudo apt upgrade -y && sudo apt update'

alias eless='ls -A -sS -p -h -gG --color --group-directories-first'
alias ls='ls --color --group-directories-first -hA -p'
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

alias clip="xclip -selection clipboard -f -r && echo "
alias copyToClip="echo \"renamed to 'clip'\" | clip"
alias fromClip="xclip -o -selection clipboard && echo "

alias aptUpgrade='sudo apt update && sudo apt upgrade -y && sudo apt update'

# alias python3='python3.13'
alias python="$(which python3)"


# Connect to Shared Folders
# # Auto-mount LennyDesk share if not already mounted
alias mysmb="source \"$SCRIPTZ/smbMounts.zsh\""

alias funs="echo 'renameFilesReplaceDir() \n\
rnd() \n\
rndN() \n\
copy() \n\
sortaEllas() \n\
rndSuffix() \n\
rndPrefix() \n\
rndUUID() \n\
kaptchame() \n\
kaptchaMe_renameFile() \n\
magickToolAliases() \n\
wslPaths() \n\
testopts()'"
