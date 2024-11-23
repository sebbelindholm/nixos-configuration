{
  pkgs,
  inputs,
  config,
  ...
}:
{
  wayland.windowManager.hyprland = {

    enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    settings = {

      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "hypridle &"
        "hyprlock || hyprctl dispatch exit"
        "nm-applet &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "swaync &"
        "waybar &"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
        "udiskie &"
        "avizo-service &"
        "swaybg -i ~/.setup/extras/wallpapers/macosBlack.jpg"
        "[workspace special silent] kitty"
        "[workspace 2 silent] vesktop"
      ];

      plugin = {
        hyprbars = {
          bar_height = 30;
          bar_color = "rgb(222222)";
          col.text = "rgb(000000)";
          bar_text_size = 12;
          bar_text_font = "Ubuntu Bold";
          bar_part_of_window = true;
          bar_button_padding = 14;
          hyprbars-button = [
            "rgb(2E2E2E), 20, 󰖭, hyprctl dispatch killactive"
            "rgb(2E2E2E), 20, , hyprctl dispatch fullscreen 1"
          ];
        };
        overview = {
          workspaceActiveBorder = "rgb(222222)";
        };
      };

      input = {
        kb_layout = "se";
        kb_options = "grp:alt_caps_toggle";
        follow_mouse = 1;
        float_switch_override_focus = 1;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = 1;
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        "col.active_border" = "rgb(ffffff)";
        "col.inactive_border" = "rgb(000000)";
        border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 0.5;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        special_scale_factor = 0.5;
        always_center_master = true;
      };

      decoration = {
        rounding = 6;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 2;
          passes = 2;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = true;
          ignore_window = false;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "straight, 0.25, 1, 0.5, 1"
        ];

        animation = [
          # name, enable, speed, curve, style
          "windowsIn, 1, 2, straight, slide bottom"
          "windowsOut, 1, 2, straight, slide top"
          "windowsMove, 1, 2, straight, slide"
          "workspaces, 1, 2, straight, slide"
          "specialWorkspaceIn, 1, 2, straight, slide"
          "specialWorkspaceOut, 1, 2, straight, slide"
        ];
      };

      bind = [

        # keybindings
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod_SHIFT, F, fullscreen, 1"
        "$mainMod SHIFT, Space, togglefloating,"
        "$mainMod, Space, exec, rofi -show drun -show-icons"
        "$mainMod ALT, L, exec, hyprlock"
        "$mainMod, Escape, exec, power-menu"
        "$mainMod, P, pseudo,"
        "$mainMod, X, togglesplit,"
        "$mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only"
        "$mainMod SHIFT, ESCAPE, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
        "$mainMod SHIFT, E, exit,"
        "$mainMod SHIFT, Z, exec, /home/sebastian/.setup/modules/home-manager/scripts/monitor_toggle dual"
        "$mainMod SHIFT, X, exec, /home/sebastian/.setup/modules/home-manager/scripts/monitor_toggle special"
        "$mainMod, Z, exec, /home/sebastian/.setup/modules/home-manager/scripts/monitor_toggle uw"
        "$mainMod, T, exec, swaync-client -t"
        "ALT, Tab, overview:toggle, "
        "$mainMod, C, togglespecialworkspace"
        "$mainMod SHIFT, C, movetoworkspace, special"

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod CTRL, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod CTRL, h, resizeactive, -80 0"
        "$mainMod CTRL, j, resizeactive, 0 80"
        "$mainMod CTRL, k, resizeactive, 0 -80"
        "$mainMod CTRL, l, resizeactive, 80 0"

        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"
        "$mainMod ALT, h, moveactive,  -80 0"
        "$mainMod ALT, j, moveactive, 0 80"
        "$mainMod ALT, k, moveactive, 0 -80"
        "$mainMod ALT, l, moveactive, 80 0"

        # media and volume controls
        # ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop,exec, playerctl stop"

        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # clipboard manager
        "$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;}' | cliphist decode | wl-copy"
      ];

      # binds active in lockscreen
      bindl = [
        # laptop brigthness
        ",XF86MonBrightnessUp, exec, lightctl up"
        ",XF86MonBrightnessDown, exec, lightctl down"
      ];

      # binds that repeat when held
      binde = [
        ",XF86AudioRaiseVolume,exec, volumectl -u up"
        ",XF86AudioLowerVolume,exec, volumectl -u down"
        ",XF86AudioMute,exec, volumectl toggle-mute"
      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "float,Viewnior"
        "center,Viewnior"
        "size 1200 800,Viewnior"
        "float,imv"
        "center,imv"
        "size 1200 725,imv"
        "float,mpv"
        "center,mpv"
        "tile,Aseprite"
        "size 1200 725,mpv"
        "float,audacious"
        "tile, neovide"
        "idleinhibit focus,mpv"
        "float,udiskie"
        "tile, class:(google-chrome)"
        "float,title:^(Transmission)$"
      ];

      # windowrulev2
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(google-chrome)$"
        "idleinhibit fullscreen, class:^(Spotify)$"
        "float,class:^(org.gnome.FileRoller)$"
        "center,class:^(org.gnome.FileRoller)$"
        "size 850 500,class:^(org.gnome.FileRoller)$"
        "size 850 500,title:^(File Upload)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
      ];

    };

    extraConfig = "
      monitor=,preferred,auto,auto

      xwayland {
        force_zero_scaling = true
      }

      source = ~/.config/hypr/device_specific.conf
    ";
  };
}
