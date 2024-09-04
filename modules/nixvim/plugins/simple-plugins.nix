{ lib, config, pkgs, ... }:

{
    programs = {
        nixvim = {
            plugins = {

                    lightline.enable = true;

                    neo-tree = {
                        enable = true;
                        closeIfLastWindow = true;
                        filesystem.filteredItems.hideHidden = false;
                    };

                    

                    auto-save = {
                        enable = true;
                        settings.enabled = true;
                    };

                indent-blankline = {
                        enable = true;
                        settings = {
                        indent = {
                            ##smart_indent_cap = true;
                            char = " ";
                        };
                        scope = {
                            enabled = true;
                            char = "│";
                        };
                    };
                };

                    toggleterm = {
                        enable = true;
                        settings = {
                            open_mapping = "[[<C-t>]]";
                        };
                    };

                    which-key.enable = true;

                    wilder = {
                        enable = true;
                        modes = [ ":" "/" "?" ];
                    };

                    fidget = {
                        enable = true;
                        progress = {
                            suppressOnInsert = true;
                            ignoreDoneAlready = true;
                            pollRate = 0.5;
                        };
                    };

                    gitsigns = {
                        enable = true;
                        settings = {
                            current_line_blame = true;
                            trouble = true;
                        };
                    };
                };
                extraConfigLua = ''
                    require("neo-tree").setup({
                        filesystem = {
                            filtered_items = {
                            visible = false,
                                hide_dotfiles = false,
                                never_show = {
                                    ".git",
                                },
                            };
                        },
                    })
                '';
            };
        };
}

