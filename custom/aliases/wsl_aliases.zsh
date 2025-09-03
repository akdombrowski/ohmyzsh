#!/usr/bin/env zsh

# if can't read the big comments, turn off 'wrap' feature

alias os="echo $(uname -sro)"

alias whichAlias="echo $WSL_ALIASES"

# spaces on ends are intentional in case need sudo at the front and to add the search term at the end
alias searchAPTByName=' apt search --names-only '

alias zoursh="source ~/.zshrc"
alias condact="conda activate "

# ********************************************************
# *'####'##::::'##:::'###::::'######::'########:'######::*
# *. ##::###::'###::'## ##::'##... ##::##.....:'##... ##:*
# *: ##::####'####:'##:. ##::##:::..:::##:::::::##:::..::*
# *: ##::## ### ##'##:::. ##:##::'####:######::. ######::*
# *: ##::##. #: ##:#########:##::: ##::##...::::..... ##:*
# *: ##::##:.:: ##:##.... ##:##::: ##::##::::::'##::: ##:*
# *'####:##:::: ##:##:::: ##. ######:::########. ######::*
# *....:..:::::..:..:::::..::......:::........::......:::*
# ********************************************************

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

#  ___ _   _ _  ____     _____ _______        __
# |_ _| \ | | |/ /\ \   / /_ _| ____\ \      / /
#  | ||  \| | ' /  \ \ / / | ||  _|  \ \ /\ / / 
#  | || |\  | . \   \ V /  | || |___  \ V  V /  
# |___|_| \_|_|\_\   \_/  |___|_____|  \_/\_/   
alias ink="~/inkscape/squashfs-root/AppRun"
alias inkview="ink inkview"

: "
//////////////////////////////////////////////////////////
//:'######::'#######:'########:'####'##::: ##:'######::://
//'##... ##'##.... ##:##.... ##. ##::###:: ##'##... ##:://
// ##:::..::##:::: ##:##:::: ##: ##::####: ##:##:::..::://
// ##:::::::##:::: ##:##:::: ##: ##::## ## ##:##::'####://
// ##:::::::##:::: ##:##:::: ##: ##::##. ####:##::: ##:://
// ##::: ##:##:::: ##:##:::: ##: ##::##:. ###:##::: ##:://
//. ######:. #######::########:'####:##::. ##. ######::://
//:......:::.......::........::....:..::::..::......:::://
//////////////////////////////////////////////////////////
"

alias chromeDebug='/mnt/c/Program Files/Google/Chrome/Application/chrome.exe --remote-debugging-port=9222 --user-data-dir=remote-debug-profile'

alias python3='python3.13'
alias python='python3.13'

alias yarnOn="corepack enable && yarn set version stable --only-if-needed"
alias yarndk='yarn dlx @yarnpkg/sdks vscode'
alias ncu="yarn dlx npm-check-updates"
alias npx_ncu="npx npm-check-updates"

alias subl='/mnt/c/Program\ Files/Sublime\ Text/subl.exe'
alias code='/mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe'

: "
////////////////////////////////////////////////////////////////////////
//'##::::'##:::'###:::'####'##::: ##'########:::'###:::'####'##::: ##://
// ###::'###::'## ##::. ##::###:: ##... ##..:::'## ##::. ##::###:: ##://
// ####'####:'##:. ##:: ##::####: ##::: ##::::'##:. ##:: ##::####: ##://
// ## ### ##'##:::. ##: ##::## ## ##::: ##:::'##:::. ##: ##::## ## ##://
// ##. #: ##:#########: ##::##. ####::: ##::::#########: ##::##. ####://
// ##:.:: ##:##.... ##: ##::##:. ###::: ##::::##.... ##: ##::##:. ###://
// ##:::: ##:##:::: ##'####:##::. ##::: ##::::##:::: ##'####:##::. ##://
//..:::::..:..:::::..:....:..::::..::::..::::..:::::..:....:..::::..:://
////////////////////////////////////////////////////////////////////////
"
alias aptUpgrade='sudo apt update && sudo apt upgrade -y && sudo apt update'

alias ssh-keygen='sh $ZSH_CUSTOM/scripts/ssh-keygen-win.sh'

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
