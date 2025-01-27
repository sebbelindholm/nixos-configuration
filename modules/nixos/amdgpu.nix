{
  lib,
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    lact
  ];

  #systemd.services.lact = {
  #    description = "AMDGPU Control Daemon";
  #after = [ "multi-user.target" ];
  #wantedBy = [ "multi-user.target" ];
  #serviceConfig = {
  #  ExecStart = "${pkgs.lact}/bin/lact daemon";
  #};
  #enable = true;
  #};
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  #systemd.tmpfiles.rules = [
  #  "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  #];

  #hardware.graphics.extraPackages = with pkgs; [
  #  rocmPackages.clr.icd
  #];

  #hardware.amdgpu.opencl.enable = true;

  hardware.graphics = {
    enable = true;
  };

  #hardware.amdgpu.opencl.enable = true;

  hardware.amdgpu.amdvlk.support32Bit.enable = true;

  hardware.amdgpu.amdvlk.enable = true;

  environment.variables.AMD_VULKAN_ICD = "RADV";
}
