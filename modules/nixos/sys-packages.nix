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
      killall
      niri
      omnisharp-roslyn
      dotnetCorePackages.sdk_9_0
      dotnetCorePackages.sdk_8_0_3xx
      mono
      csharp-ls
      qmk
      zulu8
      xclip
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
      matlab-language-server
      texlab
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
      texliveFull
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
