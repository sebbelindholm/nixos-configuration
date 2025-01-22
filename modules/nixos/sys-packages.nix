{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/sebastian/.setup";
  };

  environment.systemPackages = with pkgs; [
    jetbrains.idea-community-bin
    lmstudio
    zulu
    zulu17
    zulu23
    qmk
    zulu8
    xclip
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
}
