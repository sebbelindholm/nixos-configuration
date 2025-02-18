{ pkgs, config, ... }:
{

  xdg.configFile."rofi/config.rasi".text = ''
     
    /*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/
    /*██████╗  ██████╗ ███████╗██╗   */
    /*██╔══██╗██╔═══██╗██╔════╝██║   */
    /*██████╔╝██║   ██║█████╗  ██║   */
    /*██╔══██╗██║   ██║██╔══╝  ██║   */
    /*██║  ██║╚██████╔╝██║     ██║   */
    /*╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝   */
    /*                               */
    /*	| Rofi config            */
    /*	| Created(I don't know)	 */
    /*	| Modified by Far        */
    /*  | Modified by thalestinoco   */
    /*				 */
    /*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*/

    configuration {
    	modi:                       "drun,run";
        show-icons:                 true;
        display-drun:               "apps";
        display-run:                "run";
        display-filebrowser:        "files";
        display-window:             "open";
    	drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
    	window-format:              "{w} · {c} · {t}";
    }

    * {
        font: "Ubuntu 14";
    }

    * {
        border-colour:               @dark-gray;
        handle-colour:               @white;
        background-colour:           @dark-gray;
        foreground-colour:           @white;
        alternate-background:        @white;
        normal-background:           @dark-gray;
        normal-foreground:           @white;
        urgent-background:           @white;
        urgent-foreground:           @dark-gray;
        active-background:           @white;
        active-foreground:           @dark-gray;
        selected-normal-background:  @light-blue;
        selected-normal-foreground:  @dark-gray;
        selected-urgent-background:  @white;
        selected-urgent-foreground:  @dark-gray;
        selected-active-background:  @white;
        selected-active-foreground:  @dark-gray;
        alternate-normal-background: @dark-gray;
        alternate-normal-foreground: @white;
        alternate-urgent-background: @white;
        alternate-urgent-foreground: @dark-gray;
        alternate-active-background: @white;
        alternate-active-foreground: @dark-gray;
    }

    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       600px;
        x-offset:                    0px;
        y-offset:                    0px;

        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               8px;
        border-color:                @border-colour;
        cursor:                      "default";
        background-color:            @background-colour;
    }

    mainbox {
        enabled:                     true;
        spacing:                     3px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @border-colour;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
    }

    inputbar {
        enabled:                     true;
        spacing:                     1px;
        margin:                      10px;
        padding:                     10px 5px;
        border:                      0px 0px 1px 0px;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        children:                    [ "entry" ];
    }

    sidebar {
        background-color:            transparent;
        margin:                      10px;
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         ":";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "search...";
        placeholder-color:           inherit;
    }

    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       8;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        cursor:                      "default";
    }
    scrollbar {
        handle-width:                1px ;
        handle-color:                @handle-colour;
        border-radius:               0px;
        background-color:            @alternate-background;
    }

    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     4px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            transparent;
        text-color:                  var(normal-foreground);
    }
    element normal.urgent {
        background-color:            var(urgent-foreground);
        text-color:                  var(urgent-background);
    }
    element normal.active {
        background-color:            var(active-foreground);
        text-color:                  var(active-background);
    }
    element selected.normal {
        background-color:            @white;
        text-color:                  @black;
    }
    element selected.urgent {
        background-color:            var(selected-urgent-foreground);
        text-color:                  var(selected-urgent-background);
    }
    element selected.active {
        background-color:            @brown;
        text-color:                  var(selected-active-background);
    }
    element alternate.normal {
        background-color:            transparent;
        text-color:                  var(alternate-normal-foreground);
    }
    element alternate.urgent {
        background-color:            var(alternate-urgent-foreground);
        text-color:                  var(alternate-urgent-background);
    }
    element alternate.active {
        background-color:            var(alternate-active-foreground);
        text-color:                  var(alternate-active-background);
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        36px;
        cursor:                      inherit;
        margin:                      0px 10px;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    mode-switcher{
        enabled:                     false;
        spacing:                     0px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
    }
    button {
        padding:                     5px;
        border:                      0px solid;
        border-radius:               5px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      pointer;
        margin:                      10px;
    }
    button selected {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }

    message {
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
    }
    textbox {
        padding:                     5px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @border-colour;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
        placeholder-color:           @foreground-colour;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     30px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            @background-colour;
        text-color:                  @foreground-colour;
    }

    * {
        light-blue:  rgba ( 187, 204, 221, 100 %);
        dark-gray:   rgba ( 34, 34, 34, 95 %);
        white:       rgba ( 255, 255, 255, 100 %);
        red:         rgba ( 255, 0, 0, 100 %);
        black:       rgba ( 0, 0, 0, 100 %);
        blue:        rgba ( 0, 0, 255, 100 % );
        brown:       rgba ( 255, 230, 167, 100 % );
    } '';
}
