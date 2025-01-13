{
  lib,
  config,
  pkgs,
  ...
}:
let
  llama-copilot-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "llama-copilot-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Faywyn";
      repo = "llama-copilot.nvim";
      rev = "8cd0a212868ccd0b24b70662d6facd5ccb165c2d";
      hash = "sha256-hQ2IFFAhh+LtvzRy9gyg5eP/5XCneh4uW7jE7w6hz5E";
    };
  };
in
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    llama-copilot-nvim
    kanagawa-nvim
    vscode-nvim
    onedark-nvim
    onedarker-nvim
    onedarkpro-nvim
    omnisharp-extended-lsp-nvim
    render-markdown-nvim
    neo-tree-nvim
    telescope-fzf-native-nvim
    telescope-ui-select-nvim
    telescope-nvim
    nvim-autopairs
    dashboard-nvim
    barbecue-nvim
    comment-nvim
    cmp-nvim-lsp
    luasnip
    cmp_luasnip
    friendly-snippets
    nvim-cmp
    conform-nvim
    dressing-nvim
    gitsigns-nvim
    indent-blankline-nvim
    lazygit-nvim
    lsp-zero-nvim
    nvim-lspconfig
    lualine-nvim
    statuscol-nvim
    nvim-surround
    toggleterm-nvim
    nvim-treesitter
    nvim-treesitter.withAllGrammars
    trouble-nvim
    nvim-ufo
    which-key-nvim
    nvim-colorizer-lua
    fidget-nvim
    numb-nvim
    onedark-nvim
    tokyonight-nvim
    auto-session
    vimtex
  ];
}
