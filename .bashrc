# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  # non-interactive
  alias echo=/bin/false
fi

# Make sure terminal is recognized
faking="no"
if [[ "$TERM" == "rxvt-unicode-256color" && ! -e "/usr/share/terminfo/r/$TERM" ]]; then
  if [ -e "/usr/share/terminfo/r/rxvt-256color" ]; then
    faking="nounicode"
    export TERM='rxvt-256color';
  else
    faking="vt100"
    export TERM='vt100';
  fi
fi

# Style with solarized
if [[ -e $HOME/dev/others/base16/shell ]]; then
  source "$HOME/dev/others/base16/shell/scripts/base16-atelier-dune.sh"
else
  if [[ "$TERM" == "linux" ]]; then
	  echo -en "\e]P0002b36\e]P1dc322f\e]P2859900\e]P3b58900\e]P4268bd2\e]P5d33682\e]P62aa198\e]P7eee8d5\e]P9cb4b16\e]P8002b36\e]PA586e75\e]PB657b83\e]PC839496\e]PD6c71c4\e]PE93a1a1\e]PFfdf6e3"
	  echo -e '\e[37mbtw: base16 shell style not available, emulating solarized\e[0m';
  else
	  echo -e '\e[37mbtw: base16 shell style not available\e[0m';
  fi
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
