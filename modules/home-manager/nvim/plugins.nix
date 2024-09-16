{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
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
  ];
}
