{pkgs, ...}: let
  hms = pkgs.writeShellScriptBin "hms" ''
    pushd $HOME/.snowstorm
    hostname=$(hostname)
    home-manager --flake .#$USER@$hostname switch
    popd
  '';

  nrs = pkgs.writeShellScriptBin "nrs" ''
    pushd $HOME/.snowstorm
    hostname=$(hostname)
    sudo nixos-rebuild --flake .#$hostname switch
    popd
  '';

  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" ''
    #!/usr/bin/env bash

    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(find ~/projects/ ~/work/pimlico/ ~/work/mev/ -mindepth 1 -maxdepth 1 -type d | fzf)
    fi

    if [[ -z $selected ]];
    then
        exit 0
    fi

    selected_name=$(basename "$selected" | tr '.' '_')
    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]];
    then
        tmux new-session -s "$selected_name" -c "$selected"
        exit 0
    fi

    if [[ -z $TMUX ]]; then
        if ! tmux has-session -t "$selected_name" 2>/dev/null;
        then
            tmux new-session -s "$selected_name" -c "$selected"
            exit 0
        fi
        tmux a -t "$selected_name"
        exit 0
    fi

    if ! tmux has-session -t "$selected_name" 2>/dev/null;
    then
        tmux new-session -ds "$selected_name" -c "$selected"
    fi

    tmux switch-client -t "$selected_name"
  '';

  wifi-menu = pkgs.writeShellScriptBin "wifi-menu" ''
      bssid=$( ${pkgs.networkmanager}/bin/nmcli dev wifi list | sed -n '1!p' | cut -b 9- | ${pkgs.rofi}/bin/rofi -dmenu -theme ~/.config/rofi/wifi-menu/style-1.rasi -p " " | cut -d' ' -f1)

    [ -z "$bssid" ] && exit

    password=$(echo "" | ${pkgs.rofi}/bin/rofi -dmenu -theme ~/.config/rofi/wifi-menu/wifi-password.rasi -p " " )

    [ -z "$password" ] && exit

    icon=/etc/nixos/hm-modules/icons/wifi-icon.png
    iconE=/etc/nixos/hm-modules/icons/error-warning.png

    # Notify the status
    notify_connect() {
      status=$(echo $?)
      wifi_network=$( ${pkgs.networkmanager}/bin/nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2 | sed 's/^[^:]*://')

      if [[ "$status" == '0' ]]; then
        ${pkgs.dunst}/bin/dunstify -u low --replace=69 -i "$icon" "Connected to Network: $wifi_network"
      elif [[ "$status" -gt '0' ]]; then
        ${pkgs.dunst}/bin/dunstify -u low --replace=69 -i "$iconE" "Unable to Connect: Incorrect Passphrase"
      fi
    }

    # Connect to the Wifi & Display status
    ${pkgs.networkmanager}/bin/nmcli device wifi connect $bssid password $password ; notify_connect
  '';
in {
  home.packages = [
    wifi-menu
    tmux-sessionizer
    hms
    nrs
  ];
}
