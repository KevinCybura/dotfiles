set -g theme_display_rust yes


#alias pmix="cd ~/Code/elx_playground && iex -S mix && cd -"
#export ERL_AFLAGS="-kernel shell_history enabled"


set -gx TERM xterm-256color
set -U fish_user_abbreviations

alias pmix='cd ~/Code/elx_playground && iex -S mix && cd -'
alias vim nvim

function pmix
 cd ~/Code/elx_playground && iex -S mix && cd -
end

set -gx ERL_AFLAGS "-kernel shell_history enabled"


if exa --version >/dev/null
	set -U fish_user_abbreviations $fish_user_abbreviations 'l=exa'
	set -U fish_user_abbreviations $fish_user_abbreviations 'ls=exa'
	set -U fish_user_abbreviations $fish_user_abbreviations 'll=exa -l'
	set -U fish_user_abbreviations $fish_user_abbreviations 'lll=exa -la'
else
	set -U fish_user_abbreviations $fish_user_abbreviations 'l=ls'
	set -U fish_user_abbreviations $fish_user_abbreviations 'll=ls -l'
	set -U fish_user_abbreviations $fish_user_abbreviations 'lll=ls -la'
end

if [ -e /usr/share/fish/functions/fzf_key_bindings.fish ]; and status --is-interactive
	source /usr/share/fish/functions/fzf_key_bindings.fish
end

if test -f /usr/share/autojump/autojump.fish;
	source /usr/share/autojump/autojump.fish;
end


if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations...

  abbr c 'cargo'
  abbr clippy 'cargo +nightly clippy'
end


# set -U fish_user_abbreviations $fish_user_abbreviations 'c=cargo'
# set -U fish_user_abbreviations $fish_user_abbreviations 'm=make'
# set -U fish_user_abbreviations $fish_user_abbreviations 'o=xdg-open'
# set -U fish_user_abbreviations $fish_user_abbreviations 'g=git'
# set -U fish_user_abbreviations $fish_user_abbreviations 'gc=git checkout'
# set -U fish_user_abbreviations $fish_user_abbreviations 'vimdiff=nvim -d'
# set -U fish_user_abbreviations $fish_user_abbreviations 'clippy=cargo +nightly clippy'
# set -U fish_user_abbreviations $fish_user_abbreviations 'cargot=cargo t'
# set -U fish_user_abbreviations $fish_user_abbreviations 'gah=git stash; and git pull --rebase; and git stash pop'
# set -U fish_user_abbreviations $fish_user_abbreviations 'c=cargo'



set FORTUNES computers debian linux magic
set FORTUNES futurama hitchhiker $FORTUNES
set FORTUNES firefly calvin perl $FORTUNES
set FORTUNES science wisdom miscellaneous $FORTUNES
set FORTUNES off/atheism off/debian off/linux off/privates $FORTUNES
set FORTUNES off/religion off/vulgarity $FORTUNES

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3


# For RLS
# https://github.com/fish-shell/fish-shell/issues/2456
 setenv LD_LIBRARY_PATH (rustc +nightly --print sysroot)"/lib:$LD_LIBRARY_PATH"
setenv RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"



# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

# Base16 Shell
if status --is-interactive
#    eval sh $HOME/.config/base16-shell/scripts/base16-atelier-dune.sh
    eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
    
end

# Pretty ls colors
if test -e ~/.dir_colors
	setenv LS_COLORS (sh --noprofile -c 'eval "$(dircolors -b ~/.dir_colors)"; echo $LS_COLORS')
end

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

