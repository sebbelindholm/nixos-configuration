{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.std-nix;
in
{
  options.std-nix = {
    enable = lib.mkEnableOption "enable standard nix module";
  };

  config = lib.mkIf cfg.enable {
    nix = {
      settings = {
        auto-optimise-store = true;
        substituters = [ "https://cosmic.cachix.org/" ];
        trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 2d";
      };
    };
  };
}
