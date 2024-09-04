{ lib, config, pkgs, ... }:

let
  cfg = config.git;
in
{
  options.git = {
    enable 
      = lib.mkEnableOption "enable git module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
        git = {
            enable = true;
            userName = "Sebastian Lindholm Gustafsson";
            userEmail = "sebastianlindholm@outlook.com";

            extraConfig = {
                credential.helper = "${
                    pkgs.git.override { withLibsecret = true; }
                }/bin/git-credential-libsecret";

                init.defaultBranch = "main";

                pull = {
                    rebase = false;
                };
            };

            ignores = [
                "*~"
                ".DS_Store"
            ];
        };
    };
  };
}
