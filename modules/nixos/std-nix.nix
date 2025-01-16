{
  lib,
  config,
  pkgs,
  ...
}:
{
  nix = {
    settings = {
      auto-optimise-store = true;
    };

    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };
}
