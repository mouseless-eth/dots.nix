{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.waybar.enable = lib.mkDefault true;
  myHomeManager.dunst.enable = lib.mkDefault true;
  myHomeManager.rofi.enable = lib.mkDefault true;

  myHomeManager.nvim.enable = lib.mkDefault true;
  myHomeManager.xdg.enable = lib.mkDefault true;
  myHomeManager.fonts.enable = lib.mkDefault true;

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_QPA_PLATFORM = "wayland";
    QT_SCALE_FACTOR = "1.25";
  };

  home.packages = with pkgs; [
    libreoffice
    nurl
    nix-search-cli
    yubikey-manager-qt

    mullvad-vpn
    mullvad-browser

    slack
    _1password-gui
    telegram-desktop
    #qutebrowser
    librewolf
    chromium
    discord

    spotify

    grimblast
    pavucontrol
    overskride
  ];
}
