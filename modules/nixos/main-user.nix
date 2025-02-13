{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;
  users.users.sebastian = {
    isNormalUser = true;
    initialPassword = "12345";
    description = "sebastian";
    extraGroups = [
      "networkmanager"
      "wheel"
      #"vboxusers"
      #"vboxsf"
    ];
    shell = pkgs.zsh;
  };
  environment.variables.EDITOR = "nvim";
}
