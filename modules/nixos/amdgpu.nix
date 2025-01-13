{
  lib,
  config,
  pkgs,
  ...
}:
{
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd

  ];

  hardware.graphics = {
    enable = true;
  };

  hardware.amdgpu.amdvlk.support32Bit.enable = true;

  hardware.amdgpu.amdvlk.enable = true;

  environment.variables.AMD_VULKAN_ICD = "RADV";
}
