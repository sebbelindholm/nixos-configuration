{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      #background_opacity = 0.7;
      #background_blur = 1;
    };
    #themeFile = "tokyo_night_night";
    font.name = "JetbrainsMono Nerd Font";
    font.size = 14;

    extraConfig = ''
                background                #1d1d1d
      foreground                #deddda

      selection_background      #303030
      selection_foreground      #c0bfbc

      url_color                 #1a5fb4

      wayland_titlebar_color    system
      macos_titlebar_color      system

      cursor                    #deddda
      cursor_text_color         #1d1d1d

      active_border_color       #4f4f4f
      inactive_border_color     #282828
      bell_border_color         #ed333b
      visual_bell_color         none

      active_tab_background     #242424 
      active_tab_foreground     #fcfcfc
      inactive_tab_background   #303030
      inactive_tab_foreground   #b0afac
      tab_bar_background        none
      tab_bar_margin_color      none

      color0                    #1d1d1d
      color1                    #ed333b
      color2                    #57e389
      color3                    #ff7800
      color4                    #62a0ea
      color5                    #9141ac
      color6                    #5bc8af
      color7                    #deddda

      color8                    #9a9996
      color9                    #f66151
      color10                   #8ff0a4
      color11                   #ffa348
      color12                   #99c1f1
      color13                   #dc8add
      color14                   #93ddc2
      color15                   #f6f5f4
    '';
  };
}
