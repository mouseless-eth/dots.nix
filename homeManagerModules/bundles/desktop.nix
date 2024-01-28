{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.waybar.enable = lib.mkDefault true;
  myHomeManager.hyprpaper.enable = lib.mkDefault true;
  myHomeManager.dunst.enable = lib.mkDefault true;
  myHomeManager.rofi.enable = lib.mkDefault true;

  myHomeManager.nvim.enable = lib.mkDefault true;
  myHomeManager.xdg.enable = lib.mkDefault true;
  myHomeManager.fonts.enable = lib.mkDefault true;

  #qt.enable = true;
  #qt.platformTheme = "gtk";
  #qt.style.name = "adwaita-dark";

  #home.sessionVariables = {
  #  QT_STYLE_OVERRIDE = "adwaita-dark";
  #};

  home.packages = with pkgs; [
    nix-search-cli
    chromium
    telegram-desktop
    discord
    pavucontrol
  ];
}
