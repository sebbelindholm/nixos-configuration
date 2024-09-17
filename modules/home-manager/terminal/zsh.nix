{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.zsh;
in
{
  options.zsh = {
    enable = lib.mkEnableOption "enable zsh module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          #dconf-save = "dconf dump / | dconf2nix > ~/.setup/modules/home-manager/gnome/dconf.nix";
          nixos-build = "sudo nixos-rebuild switch --flake ~/.setup#";
          nixos-clean = "sudo nix-collect-garbage -d; nix-collect-garbage -d";
          dconf-dump = "dconf dump / > ~/.setup/modules/home-manager/gnome/dconf-settings.ini";
          dconf-load = "dconf load / < ~/.setup/modules/home-manager/gnome/dconf-settings.ini";
          ls = "eza --icons always --long --git --color=always --no-filesize --no-time";
          cat = "bat";
        };
        initExtra = ''
          bindkey -e
          export PATH=/home/sebastian/.setup/modules/home-manager/scripts:$PATH
          eval "$(fzf --zsh)"

          export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
          export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
          export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

          _fzf_compgen_path() {
            fd --hidden --exclude .git . "$1"
          }

          _fzf_compgen_dir() {
            fd --type=d --hidden --exclude .git . "$1"
          }

          show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

          export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
          export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

          _fzf_comprun() {
            local command=$1
            shift

            case "$command" in
              cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
              export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
              ssh)          fzf --preview 'dig {}'                   "$@" ;;
              *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
            esac
          }

          export BAT_THEME=DarkNeon
        '';
      };
    };
  };
}
