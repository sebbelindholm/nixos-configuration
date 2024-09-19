{
  lib,
  config,
  pkgs,
  ...
}:

let
  syspkg = config.sys-packages;
in

{
  options.sys-packages = {
    enable = lib.mkEnableOption "enable standard system packages.";
  };

  config = lib.mkIf syspkg.enable {
    environment.systemPackages = with pkgs; [
      gnome-boxes
      via
      vial
      delta
      eza
      bat
      fzf
      wget
      libva-utils
      nodePackages_latest.typescript-language-server
      vscode-langservers-extracted
      nodejs
      nvtopPackages.full
      btop
      vulkan-tools
      glxinfo
      zip
      unzip
      powertop
      git
      stow
      gcc
      ripgrep
      vim
      prettierd
      libclang
      clang-tools
      llvmPackages_19.clang-unwrapped
      llvmPackages_19.clang-tools
      stylua
      lua
      haskellPackages.command
      python3
      luarocks
      nodejs_22
      wl-clipboard
      fd
      lua-language-server
      gnumake
      cmake
      sumneko-lua-language-server
      javascript-typescript-langserver
      typescript
      rust-analyzer
      pyright
      nixd
      nixfmt-rfc-style
    ];
  };
}
