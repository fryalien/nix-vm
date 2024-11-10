{ config, pkgs, ... }:

{

home.file.".config/fish/config.fish".text = ''
if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

#function fish_prompt
#    echo " ~ "
#end

set fish_color_valid_path

#function fish_prompt
#    echo (prompt_pwd) "> "
#echo (set_color -o 00d3b8)"➜" (set_color -o 3daee9)(prompt_pwd)(set_color -o yellow) "✗ "
#end

#-------------------------
# ALIASES
#-------------------------

### NIXOS GENERAL
# list active channel
abbr lsch 'sudo nix-channel --list'
# delete old stuff
abbr clean 'sudo nix-collect-garbage --delete-older-than 3d'
# look when something is being delete
abbr lst 'systemctl list-timers'
# list generations
abbr lsgen 'sudo nix-env --list-generations --profile /nix/var/nix/profiles/system'

### WITHOUT FLAKES
#abbr up 'sudo nix-channel --update'
#rs 'sudo nixos-rebuild switch'

### WITH FLAKES
# update nix flake, has to be in the directory of the flake.lock file
#abbr up 'cd ~/nixcfg; nix flake update'
# update the system
#abbr rs 'sudo nixos-rebuild switch --flake ~/nixcfg'

### WITH FALKES AND HOME MANAGER
abbr up 'cd ~/nixcfg; nix flake update'
# UPDATE SYSTEM
abbr rs  'sudo nixos-rebuild switch --flake ~/nixcfg'
abbr rhm 'home-manager switch --flake ~/nixcfg'

# CLI COMMANDS
alias l 'eza -lh --group-directories-first'
alias la 'eza -lha --group-directories-first'
abbr t 'btop'
abbr ri 'rg -i'
abbr s 'sudo'
abbr d 'du -sh *'
abbr sfi 'source ~/.config/fish/config.fish'

# SHORCUTS FOR PROGRAMS
abbr v 'nvim'
abbr V 'sudo nvim'
abbr r 'ranger'
abbr e 'micro'

# PLACES
abbr dw 'cd ~/Downloads'
abbr dc 'cd ~/Documents'
abbr pc 'cd ~/Pictures'
abbr vd 'cd ~/Videos'
abbr gh 'cd ~/BIGDATA/GitHub'

# POWER
abbr sd 'shutdown now'
abbr re 'reboot'

# RESOLUTION
abbr 4k 'xrandr -s 3840x2160'
abbr hd 'xrandr -s 1920x1080'

# MELD CONFIG
abbr fic 'meld ~/.config/fish/config.fish ~/BIGDATA/GitHub/dotfiles/fish/config.fish &; disown'
abbr i3c 'meld ~/.config/i3/config ~/BIGDATA/GitHub/dotfiles/i3/config &; disown'
abbr i3s 'meld ~/.config/i3/i3status.conf ~/BIGDATA/GitHub/config/i3/i3status.conf &; disown'

# SOURCE CONFIG FILES
abbr fis 'source ~/.config/fish/config.fish'
abbr zshs 'source ~/.zshrc'
abbr bas ' source ~/.bashrc'

# YOUTUBE DOWNLOAD
abbr yab 'cd ~/Downloads/; yt-dlp -x --audio-format mp3 -f bestaudio '
abbr ya 'cd ~/Downloads/; yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 '
abbr yv 'cd ~/Downloads/; yt-dlp '

# PYTHON3 SERVER
abbr py 'python3 -m http.server -b '
abbr ip 'hostname -I'
abbr web '~/.local/bin/httpserv.sh'

# git
abbr gc 'cd /BIGDATA/git; git clone'

#mygit config
abbr gdot 'git clone https://github.com/fryalien/dotfiles'

# FZF settings
fzf --fish | source

export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_OPTS="--preview='less {}' --height=100% --bind shift-up:preview-page-up,shift-down:preview-page-down"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"


'';

}