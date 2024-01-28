{
  config,
  pkgs,
  lib,
  ...
}: let
  waybar_config = import ./config.nix {
    inherit config;
    inherit lib;
  };
  waybar_style = import ./style.nix;
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
    });
    style = waybar_style;
    settings = waybar_config;
  };
}
