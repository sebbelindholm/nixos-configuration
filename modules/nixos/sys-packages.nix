{ lib, config, pkgs, ... }:

let
    syspkg = config.sys-packages;
in

{
  options.sys-packages = {
    enable 
      = lib.mkEnableOption "enable standard system packages.";
  };

  config = lib.mkIf syspkg.enable {
    environment.systemPackages = with pkgs; [
        wget
        nvtopPackages.full
        btop
        zip
        unzip
        git
        stow
        gcc
        ripgrep
        vim
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
        fzf
        lua-language-server
        gnumake
        cmake
        sumneko-lua-language-server
        rust-analyzer
        pyright
        nixd
    ];
  };
}
