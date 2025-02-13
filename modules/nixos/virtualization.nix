{
  lib,
  config,
  pkgs,
  ...
}:
{
  # Add user to libvirtd group
  users.groups.libvirtd.members = [ "sebastian" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
