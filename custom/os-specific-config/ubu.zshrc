export PATH="$PATH:$HOME/.local/kitty.app/bin"

source $ALIASES_DIR/mint_aliases.zsh


PATH="${PATH:+${PATH}}:/home/akdombrowski/perl5/bin"; export PATH;
PERL5LIB="/home/akdombrowski/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/akdombrowski/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/akdombrowski/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/akdombrowski/perl5"; export PERL_MM_OPT;
