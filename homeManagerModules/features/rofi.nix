{ config, pkgs, ... }: {
  xdg.configFile."/home/mous/.config/rofi/colors/dracula.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Colors
     **/

    * {
        background:     #1E1F29FF;
        background-alt: #282A36FF;
        foreground:     #FFFFFFFF;
        selected:       #BD93F9FF;
        active:         #50FA7BFF;
        urgent:         #FF5555FF;
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/launchers/type-2/launcher.sh" = {
    executable = true;
    text = ''
          #!/usr/bin/env bash
      #

          dir="$HOME/.config/rofi/launchers/type-2"
          theme='style-1'

          rofi \
            -show drun \
            -theme ''${dir}/''${theme}.rasi
    '';
  };

  xdg.configFile."/home/mous/.config/rofi/launchers/type-2/shared/colors.rasi".text = ''
    /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Colors
     *
     * Available Colors Schemes
     *
     * adapta    catppuccin    everforest    navy       paper
     * arc       cyberpunk     gruvbox       nord       solarized
     * black     dracula       lovelace      onedark    yousai
     *
     **/

    /* Import color-scheme from `colors` directory */

    @import "~/.config/rofi/colors/dracula.rasi"
  '';

  xdg.configFile."/home/mous/.config/rofi/launchers/type-2/style-1.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Rofi Theme File
     * Rofi Version: 1.7.3
     **/

    /*****----- Configuration -----*****/
    configuration {
    	modi:                       "drun";
        show-icons:                 true;
        display-drun:               "";
    	drun-display-format:        "{name}";
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    /*****----- Main Window -----*****/
    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       400px;
        x-offset:                    0px;
        y-offset:                    0px;

        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               12px;
        border-color:                @selected;
        background-color:            @background;
        cursor:                      "default";
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @selected;
        background-color:            transparent;
        children:                    [ "inputbar", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     15px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            @selected;
        text-color:                  @background;
        children:                    [ "prompt", "entry" ];
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search...";
        placeholder-color:           inherit;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       6;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }
    scrollbar {
        handle-width:                5px ;
        handle-color:                @selected;
        border-radius:               0px;
        background-color:            @background-alt;
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     8px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            @background;
        text-color:                  @foreground;
    }
    element selected.normal {
        background-color:            @background-alt;
        text-color:                  @foreground;
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        32px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Message -----*****/
    error-message {
        padding:                     15px;
        border:                      2px solid;
        border-radius:               12px;
        border-color:                @selected;
        background-color:            @background;
        text-color:                  @foreground;
    }
    textbox {
        background-color:            @background;
        text-color:                  @foreground;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/pdf-launcher/style-1.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Rofi Theme File
     * Rofi Version: 1.7.3
     **/

    /*****----- Configuration -----*****/
    configuration {
    	modi:                       "drun,run,filebrowser";
        show-icons:                 true;
        display-drun:               " ";
        display-run:                " Run";
        display-filebrowser:        " Files";
        display-window:             " Windows";
    	drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
    	window-format:              "{w} · {c} · {t}";
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    * {
        border-colour:               var(selected);
        handle-colour:               var(selected);
        background-colour:           var(background);
        foreground-colour:           var(foreground);
        alternate-background:        var(background-alt);
        normal-background:           var(background);
        normal-foreground:           var(foreground);
        urgent-background:           var(urgent);
        urgent-foreground:           var(background);
        active-background:           var(active);
        active-foreground:           var(background);
        selected-normal-background:  var(selected);
        selected-normal-foreground:  var(background);
        selected-urgent-background:  var(active);
        selected-urgent-foreground:  var(background);
        selected-active-background:  var(urgent);
        selected-active-foreground:  var(background);
        alternate-normal-background: var(background);
        alternate-normal-foreground: var(foreground);
        alternate-urgent-background: var(urgent);
        alternate-urgent-foreground: var(background);
        alternate-active-background: var(active);
        alternate-active-foreground: var(background);
    }

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        cursor:                      "default";
        /* Backgroud Colors */
        background-color:            @background-colour;
        /* Backgroud Image */
        //background-image:          url("/path/to/image.png", none);
        /* Simple Linear Gradient */
        //background-image:          linear-gradient(red, orange, pink, purple);
        /* Directional Linear Gradient */
        //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
        /* Angle Linear Gradient */
        //background-image:          linear-gradient(45, cyan, purple, indigo);
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     40px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @border-colour;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        children:                    [ "prompt", "textbox-prompt-colon", "entry" ];
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Select PDF...";
        placeholder-color:           inherit;
    }
    num-filtered-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-num-sep {
        enabled:                     true;
        expand:                      false;
        str:                         "/";
        background-color:            inherit;
        text-color:                  inherit;
    }
    num-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    case-indicator {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       10;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   true;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
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
        handle-width:                10px ;
        handle-color:                @handle-colour;
        border-radius:               10px;
        background-color:            @alternate-background;
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            var(normal-background);
        text-color:                  var(normal-foreground);
    }
    element normal.urgent {
        background-color:            var(urgent-background);
        text-color:                  var(urgent-foreground);
    }
    element normal.active {
        background-color:            var(active-background);
        text-color:                  var(active-foreground);
    }
    element selected.normal {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }
    element selected.urgent {
        background-color:            var(selected-urgent-background);
        text-color:                  var(selected-urgent-foreground);
    }
    element selected.active {
        background-color:            var(selected-active-background);
        text-color:                  var(selected-active-foreground);
    }
    element alternate.normal {
        background-color:            var(alternate-normal-background);
        text-color:                  var(alternate-normal-foreground);
    }
    element alternate.urgent {
        background-color:            var(alternate-urgent-background);
        text-color:                  var(alternate-urgent-foreground);
    }
    element alternate.active {
        background-color:            var(alternate-active-background);
        text-color:                  var(alternate-active-foreground);
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        24px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
    }
    button {
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  inherit;
        cursor:                      pointer;
    }
    button selected {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }

    /*****----- Message -----*****/
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
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  @foreground-colour;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
        placeholder-color:           @foreground-colour;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     10px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @background-colour;
        text-color:                  @foreground-colour;
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/pdf-launcher/shared/colors.rasi".text = ''
    /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Colors
     *
     * Available Colors Schemes
     *
     * adapta    catppuccin    everforest    navy       paper
     * arc       cyberpunk     gruvbox       nord       solarized
     * black     dracula       lovelace      onedark    yousai
     *
     **/

    /* Import color-scheme from `colors` directory */

    @import "~/.config/rofi/colors/dracula.rasi"
  '';

  xdg.configFile."/home/mous/.config/rofi/pdf-launcher/shared/fonts.rasi".text = ''
    /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Fonts
     *
     **/

    * {
        font: "JetBrains Mono Nerd Font 10";
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/powermenu/powermenu.sh" = {
    executable = true;
    text = ''
        #!/usr/bin/env bash

      ## Author : Aditya Shakya (adi1090x)
      ## Github : @adi1090x
      #
      ## Rofi   : Power Menu
      #
      ## Available Styles
      #
      ## style-1   style-2   style-3   style-4   style-5

      # Current Theme
      dir="$HOME/.config/rofi/powermenu/"
      theme='style-1'

      # CMDs
      uptime="`uptime -p | sed -e 's/up //g'`"
      host=`hostname`

      # Options
      shutdown='⏻ Shutdown'
      reboot=' Reboot'
      lock='󰌾 Lock'
      suspend='󰤄 Suspend'
      logout='󰍃 Logout'
      yes=' Yes'
      no='  No'

      # Rofi CMD
      rofi_cmd() {
      	rofi -dmenu \
      		-p "$host" \
      		-mesg "Uptime: $uptime" \
      		-theme ''${dir}/''${theme}.rasi
      }

      # Confirmation CMD
      confirm_cmd() {
      	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
      		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
      		-theme-str 'listview {columns: 2; lines: 1;}' \
      		-theme-str 'element-text {horizontal-align: 0.5;}' \
      		-theme-str 'textbox {horizontal-align: 0.5;}' \
      		-dmenu \
      		-p 'Confirmation' \
      		-mesg 'Are you Sure?' \
      		-theme ''${dir}/''${theme}.rasi
      }

      # Ask for confirmation
      confirm_exit() {
      	echo -e "$yes\n$no" | confirm_cmd
      }

      # Pass variables to rofi dmenu
      run_rofi() {
      	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
      }

      # Execute Command
      run_cmd() {
      	selected="$(confirm_exit)"
      	if [[ "$selected" == "$yes" ]]; then
      		if [[ $1 == '--shutdown' ]]; then
      			systemctl poweroff
      		elif [[ $1 == '--reboot' ]]; then
      			systemctl reboot
      		elif [[ $1 == '--suspend' ]]; then
      			mpc -q pause
      			systemctl suspend && swaylock
      		elif [[ $1 == '--logout' ]]; then
      			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
      				openbox --exit
      			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
      				bspc quit
      			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
      				i3-msg exit
      			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
      				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
      			fi
      		fi
      	else
      		exit 0
      	fi
      }

      # Actions
      chosen="$(run_rofi)"
      case ''${chosen} in
          $shutdown)
      		run_cmd --shutdown
              ;;
          $reboot)
      		run_cmd --reboot
              ;;
          $lock)
      		if [[ -x '/usr/bin/betterlockscreen' ]]; then
      			betterlockscreen -l
      		elif [[ -x '/usr/bin/i3lock' ]]; then
      			i3lock
      		fi
              ;;
          $suspend)
      		run_cmd --suspend
              ;;
          $logout)
      		run_cmd --logout
              ;;
      esac
    '';
  };

  xdg.configFile."/home/mous/.config/rofi/powermenu/style-1.rasi".text = ''
        /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Rofi Theme File
     * Rofi Version: 1.7.3
     **/

    /*****----- Configuration -----*****/
    configuration {
        show-icons:                 false;
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       400px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @selected;
        cursor:                      "default";
        background-color:            @background;
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     20px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        children:                    [ "textbox-prompt-colon", "prompt"];
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "";
        padding:                     10px 14px;
        border-radius:               6px;
        background-color:            @urgent;
        text-color:                  @background;
    }
    prompt {
        enabled:                     true;
        padding:                     10px;
        border-radius:               6px;
        background-color:            @active;
        text-color:                  @background;
    }

    /*****----- Message -----*****/
    message {
        enabled:                     true;
        margin:                      0px;
        padding:                     10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @selected;
        background-color:            @background-alt;
        text-color:                  @foreground;
    }
    textbox {
        background-color:            inherit;
        text-color:                  inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        placeholder-color:           @foreground;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     10px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            @background;
        text-color:                  @foreground;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       5;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      pointer;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    element selected.normal {
        background-color:            var(selected);
        text-color:                  var(background);
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/powermenu/shared/colors.rasi".text = ''
    /**
    *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Colors
     *
     * Available Colors Schemes
     *
     * adapta    catppuccin    everforest    navy       paper
     * arc       cyberpunk     gruvbox       nord       solarized
     * black     dracula       lovelace      onedark    yousai
     *
     **/

    /* Import color-scheme from `colors` directory */

    @import "~/.config/rofi/colors/dracula.rasi"
  '';

  xdg.configFile."/home/mous/.config/rofi/powermenu/shared/fonts.rasi".text = ''
    /**
    *
    * Author : Aditya Shakya (adi1090x)
    * Github : @adi1090x
    *
    * Fonts
    *
    **/

    * {
       font: "JetBrains Mono Nerd Font 10";
     }
  '';

  xdg.configFile."/home/mous/.config/rofi/screenshot/style-1.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Rofi Theme File
     * Rofi Version: 1.7.3
     **/

    /*****----- Configuration -----*****/
    configuration {
        show-icons:                 false;
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       400px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @selected;
        cursor:                      "default";
        background-color:            @background;
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     20px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        children:                    [ "textbox-prompt-colon", "prompt"];
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "󰄀 ";
        padding:                     10px 14px;
        border-radius:               6px;
        background-color:            @urgent;
        text-color:                  @background;
    }
    prompt {
        enabled:                     true;
        padding:                     10px;
        border-radius:               6px;
        background-color:            @active;
        text-color:                  @background;
    }

    /*****----- Message -----*****/
    message {
        enabled:                     true;
        margin:                      0px;
        padding:                     10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @selected;
        background-color:            @background-alt;
        text-color:                  @foreground;
    }
    textbox {
        background-color:            inherit;
        text-color:                  inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        placeholder-color:           @foreground;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     10px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            @background;
        text-color:                  @foreground;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       2;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      pointer;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    element selected.normal {
        background-color:            var(selected);
        text-color:                  var(background);
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/screenshot/shared/colors.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Colors
     *
     * Available Colors Schemes
     *
     * adapta    catppuccin    everforest    navy       paper
     * arc       cyberpunk     gruvbox       nord       solarized
     * black     dracula       lovelace      onedark    yousai
     *
     **/

    /* Import color-scheme from `colors` directory */

    @import "~/.config/rofi/colors/dracula.rasi"
  '';

  xdg.configFile."/home/mous/.config/rofi/screenshot/shared/fonts.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Fonts
     *
     **/

    * {
        font: "JetBrains Mono Nerd Font 10";
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/wallpaper-selection/style-1.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Rofi Theme File
     * Rofi Version: 1.7.3
     **/

    /*****----- Configuration -----*****/
    configuration {
    	modi:                       "drun,run,filebrowser";
        show-icons:                 true;
        display-drun:               " Apps";
        display-run:                " Run";
        display-filebrowser:        " Files";
        display-window:             " Windows";
    	drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
    	window-format:              "{w} · {c} · {t}";
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    * {
        border-colour:               var(selected);
        handle-colour:               var(selected);
        background-colour:           var(background);
        foreground-colour:           var(foreground);
        alternate-background:        var(background-alt);
        normal-background:           var(background);
        normal-foreground:           var(foreground);
        urgent-background:           var(urgent);
        urgent-foreground:           var(background);
        active-background:           var(active);
        active-foreground:           var(background);
        selected-normal-background:  var(selected);
        selected-normal-foreground:  var(background);
        selected-urgent-background:  var(active);
        selected-urgent-foreground:  var(background);
        selected-active-background:  var(urgent);
        selected-active-foreground:  var(background);
        alternate-normal-background: var(background);
        alternate-normal-foreground: var(foreground);
        alternate-urgent-background: var(urgent);
        alternate-urgent-foreground: var(background);
        alternate-active-background: var(active);
        alternate-active-foreground: var(background);
    }

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        cursor:                      "default";
        /* Backgroud Colors */
        background-color:            @background-colour;
        /* Backgroud Image */
        //background-image:          url("/path/to/image.png", none);
        /* Simple Linear Gradient */
        //background-image:          linear-gradient(red, orange, pink, purple);
        /* Directional Linear Gradient */
        //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
        /* Angle Linear Gradient */
        //background-image:          linear-gradient(45, cyan, purple, indigo);
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     40px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @border-colour;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        children:                    [ "prompt", "textbox-prompt-colon", "entry" ];
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Select Wallpaper...";
        placeholder-color:           inherit;
    }
    num-filtered-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-num-sep {
        enabled:                     true;
        expand:                      false;
        str:                         "/";
        background-color:            inherit;
        text-color:                  inherit;
    }
    num-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    case-indicator {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     2;
        lines:                       5;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   true;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
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
        handle-width:                10px ;
        handle-color:                @handle-colour;
        border-radius:               6px;
        background-color:            @alternate-background;
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            var(normal-background);
        text-color:                  var(normal-foreground);
    }
    element normal.urgent {
        background-color:            var(urgent-background);
        text-color:                  var(urgent-foreground);
    }
    element normal.active {
        background-color:            var(active-background);
        text-color:                  var(active-foreground);
    }
    element selected.normal {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }
    element selected.urgent {
        background-color:            var(selected-urgent-background);
        text-color:                  var(selected-urgent-foreground);
    }
    element selected.active {
        background-color:            var(selected-active-background);
        text-color:                  var(selected-active-foreground);
    }
    element alternate.normal {
        background-color:            var(alternate-normal-background);
        text-color:                  var(alternate-normal-foreground);
    }
    element alternate.urgent {
        background-color:            var(alternate-urgent-background);
        text-color:                  var(alternate-urgent-foreground);
    }
    element alternate.active {
        background-color:            var(alternate-active-background);
        text-color:                  var(alternate-active-foreground);
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        84px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
    }
    button {
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  inherit;
        cursor:                      pointer;
    }
    button selected {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }

    /*****----- Message -----*****/
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
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  @foreground-colour;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
        placeholder-color:           @foreground-colour;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     10px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @background-colour;
        text-color:                  @foreground-colour;
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/wallpaper-selection/shared/fonts.rasi".text = ''
        /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Fonts
     *
     **/

    * {
        font: "JetBrains Mono Nerd Font 10";
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/wallpaper-selection/shared/colors.rasi".text = ''
    @import "~/.config/rofi/colors/dracula.rasi"
  '';

  xdg.configFile."/home/mous/.config/rofi/wifi-menu/shared/colors.rasi".text = ''
    @import "~/.config/rofi/colors/dracula.rasi"
  '';

  xdg.configFile."/home/mous/.config/rofi/wifi-menu/shared/fonts.rasi".text = ''
    * {
        font: "JetBrains Mono Nerd Font 10";
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/wifi-menu/style-1.rasi".text = ''
    /*****----- Configuration -----*****/
    configuration {
    	modi:                       "drun,run,filebrowser";
        show-icons:                 true;
        display-drun:               " Apps";
        display-run:                " Run";
        display-filebrowser:        " Files";
        display-window:             " Windows";
    	drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
    	window-format:              "{w} · {c} · {t}";
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    * {
        border-colour:               var(selected);
        handle-colour:               var(selected);
        background-colour:           var(background);
        foreground-colour:           var(foreground);
        alternate-background:        var(background-alt);
        normal-background:           var(background);
        normal-foreground:           var(foreground);
        urgent-background:           var(urgent);
        urgent-foreground:           var(background);
        active-background:           var(active);
        active-foreground:           var(background);
        selected-normal-background:  var(selected);
        selected-normal-foreground:  var(background);
        selected-urgent-background:  var(active);
        selected-urgent-foreground:  var(background);
        selected-active-background:  var(urgent);
        selected-active-foreground:  var(background);
        alternate-normal-background: var(background);
        alternate-normal-foreground: var(foreground);
        alternate-urgent-background: var(urgent);
        alternate-urgent-foreground: var(background);
        alternate-active-background: var(active);
        alternate-active-foreground: var(background);
    }

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        cursor:                      "default";
        /* Backgroud Colors */
        background-color:            @background-colour;
        /* Backgroud Image */
        //background-image:          url("/path/to/image.png", none);
        /* Simple Linear Gradient */
        //background-image:          linear-gradient(red, orange, pink, purple);
        /* Directional Linear Gradient */
        //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
        /* Angle Linear Gradient */
        //background-image:          linear-gradient(45, cyan, purple, indigo);
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     40px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @border-colour;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        children:                    [ "prompt", "textbox-prompt-colon", "entry" ];
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Connect to Network...";
        placeholder-color:           inherit;
    }
    num-filtered-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-num-sep {
        enabled:                     true;
        expand:                      false;
        str:                         "/";
        background-color:            inherit;
        text-color:                  inherit;
    }
    num-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    case-indicator {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       10;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   true;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
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
        handle-width:                10px ;
        handle-color:                @handle-colour;
        border-radius:               6px;
        background-color:            @alternate-background;
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            var(normal-background);
        text-color:                  var(normal-foreground);
    }
    element normal.urgent {
        background-color:            var(urgent-background);
        text-color:                  var(urgent-foreground);
    }
    element normal.active {
        background-color:            var(active-background);
        text-color:                  var(active-foreground);
    }
    element selected.normal {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }
    element selected.urgent {
        background-color:            var(selected-urgent-background);
        text-color:                  var(selected-urgent-foreground);
    }
    element selected.active {
        background-color:            var(selected-active-background);
        text-color:                  var(selected-active-foreground);
    }
    element alternate.normal {
        background-color:            var(alternate-normal-background);
        text-color:                  var(alternate-normal-foreground);
    }
    element alternate.urgent {
        background-color:            var(alternate-urgent-background);
        text-color:                  var(alternate-urgent-foreground);
    }
    element alternate.active {
        background-color:            var(alternate-active-background);
        text-color:                  var(alternate-active-foreground);
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        24px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
    }
    button {
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  inherit;
        cursor:                      pointer;
    }
    button selected {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }

    /*****----- Message -----*****/
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
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  @foreground-colour;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
        placeholder-color:           @foreground-colour;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     10px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @background-colour;
        text-color:                  @foreground-colour;
    }
  '';

  xdg.configFile."/home/mous/.config/rofi/wifi-menu/wifi-password.rasi".text = ''
      /**
     *
     * Author : Aditya Shakya (adi1090x)
     * Github : @adi1090x
     *
     * Rofi Theme File
     * Rofi Version: 1.7.3
     **/

    /*****----- Configuration -----*****/
    configuration {
    	modi:                       "drun,run,filebrowser";
        show-icons:                 true;
        display-drun:               " Apps";
        display-run:                " Run";
        display-filebrowser:        " Files";
        display-window:             " Windows";
    	drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
    	window-format:              "{w} · {c} · {t}";
    }

    /*****----- Global Properties -----*****/
    @import                          "shared/colors.rasi"
    @import                          "shared/fonts.rasi"

    * {
        border-colour:               var(selected);
        handle-colour:               var(selected);
        background-colour:           var(background);
        foreground-colour:           var(foreground);
        alternate-background:        var(background-alt);
        normal-background:           var(background);
        normal-foreground:           var(foreground);
        urgent-background:           var(urgent);
        urgent-foreground:           var(background);
        active-background:           var(active);
        active-foreground:           var(background);
        selected-normal-background:  var(selected);
        selected-normal-foreground:  var(background);
        selected-urgent-background:  var(active);
        selected-urgent-foreground:  var(background);
        selected-active-background:  var(urgent);
        selected-active-foreground:  var(background);
        alternate-normal-background: var(background);
        alternate-normal-foreground: var(foreground);
        alternate-urgent-background: var(urgent);
        alternate-urgent-foreground: var(background);
        alternate-active-background: var(active);
        alternate-active-foreground: var(background);
    }

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        cursor:                      "default";
        /* Backgroud Colors */
        background-color:            @background-colour;
        /* Backgroud Image */
        //background-image:          url("/path/to/image.png", none);
        /* Simple Linear Gradient */
        //background-image:          linear-gradient(red, orange, pink, purple);
        /* Directional Linear Gradient */
        //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
        /* Angle Linear Gradient */
        //background-image:          linear-gradient(45, cyan, purple, indigo);
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     40px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @border-colour;
        background-color:            transparent;
        children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        children:                    [ "prompt", "textbox-prompt-colon", "entry" ];
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Enter Passphrase...";
        placeholder-color:           inherit;
    }
    num-filtered-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-num-sep {
        enabled:                     true;
        expand:                      false;
        str:                         "/";
        background-color:            inherit;
        text-color:                  inherit;
    }
    num-rows {
        enabled:                     true;
        expand:                      false;
        background-color:            inherit;
        text-color:                  inherit;
    }
    case-indicator {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       0;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   true;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                false;
        fixed-columns:               true;

        spacing:                     5px;
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
        handle-width:                10px ;
        handle-color:                @handle-colour;
        border-radius:               6px;
        background-color:            @alternate-background;
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            var(normal-background);
        text-color:                  var(normal-foreground);
    }
    element normal.urgent {
        background-color:            var(urgent-background);
        text-color:                  var(urgent-foreground);
    }
    element normal.active {
        background-color:            var(active-background);
        text-color:                  var(active-foreground);
    }
    element selected.normal {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }
    element selected.urgent {
        background-color:            var(selected-urgent-background);
        text-color:                  var(selected-urgent-foreground);
    }
    element selected.active {
        background-color:            var(selected-active-background);
        text-color:                  var(selected-active-foreground);
    }
    element alternate.normal {
        background-color:            var(alternate-normal-background);
        text-color:                  var(alternate-normal-foreground);
    }
    element alternate.urgent {
        background-color:            var(alternate-urgent-background);
        text-color:                  var(alternate-urgent-foreground);
    }
    element alternate.active {
        background-color:            var(alternate-active-background);
        text-color:                  var(alternate-active-foreground);
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        24px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @border-colour;
        background-color:            transparent;
        text-color:                  @foreground-colour;
    }
    button {
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  inherit;
        cursor:                      pointer;
    }
    button selected {
        background-color:            var(selected-normal-background);
        text-color:                  var(selected-normal-foreground);
    }

    /*****----- Message -----*****/
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
        padding:                     5px 10px;
        border:                      0px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @alternate-background;
        text-color:                  @foreground-colour;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
        placeholder-color:           @foreground-colour;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     10px;
        border:                      2px solid;
        border-radius:               6px;
        border-color:                @border-colour;
        background-color:            @background-colour;
        text-color:                  @foreground-colour;
    }
  '';
}
