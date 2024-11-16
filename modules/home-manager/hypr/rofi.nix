{ pkgs, config, ... }:
{

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
    	modi:				"drun";
    	font:				"Rubik 10";
    	show-icons:                     true;
    	icon-theme: 			"Reversal-dark";
    	display-drun: 			"";
    	drun-display-format:            "{name}";
    	sidebar-mode: 			false;
    }

    @theme "/dev/null"

    * {
    	bg:				#151515;
    	fg:				#ffffff;
    	accent:				#687363;
    	button:				#1c1c1c;
      font: "Ubuntu 14";

    	background-color:		@bg;
    	text-color:			@fg;
    }

    window {
    	border-radius:                  7px;
    	width:			    	1000px;
    	padding: 			32px;
    }

    prompt {
    	background-color:		@button;
    	enabled:			true;
    	padding:			0.5% 32px 0% -0.5%;
    	font:				"Ubuntu 10";
    }

    entry {
        	placeholder:			"Search";
    	background-color:               @button;
        	placeholder-color:              @fg;
        	expand:                         true;
        	padding:                        0.15% 0% 0% 0%;
    }

    inputbar {
    	children:			[ prompt, entry ];
        	background-color:               @button;
        	expand:                         false;
        	border-radius:                  6px;
        	margin:                         0%;
        	padding:                        10px;
    }

    listview {
        	columns:                        4;
        	lines:	                        3;
        	cycle:                          false;
        	dynamic:                        true;
        	layout:                         vertical;
    }

    mainbox {
        	children:                       [ inputbar, listview ];
        	spacing:                       	2%;
        	padding:                        2% 1% 2% 1%;
    }

    element {
        	orientation:                    vertical;
        	padding:                        2% 0% 2% 0%;
    }

    element-icon {
        	size:                           48px;
        	horizontal-align:	 	0.5;
    }

    element-text {
        	expand:                         true;
        	horizontal-align:               0.5;
        	vertical-align:                 0.5;
        	margin:                         0.5% 0.5% -0.5% 0.5%;
    }

    element-text, element-icon {
    	background-color:		inherit;
    	text-color:			inherit;
    }

    element selected {
        	background-color:               @button;
        	border-radius:                  6px;
    }
  '';
}
