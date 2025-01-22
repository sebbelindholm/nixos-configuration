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
    description = "main user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
      "minecraft"
    ];
    shell = pkgs.zsh;
  };
  users.groups.minecraft = { };
  environment.variables.EDITOR = "nvim";
  #services.getty.autologinUser = "sebastian";
}
