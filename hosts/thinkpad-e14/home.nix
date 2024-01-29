{
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = [outputs.homeManagerModules.default];

  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop.enable = true;
    bundles.dev.enable = true;

    monitors = [
      {
        name = "eDP-1";
        primary = true;
        width = 1920;
        height = 1080;
        refreshRate = 60.0;
        x = 0;
        y = 0;
        scale = 1.5;
      }
    ];
  };

  home = {
    username = "mous";
    homeDirectory = lib.mkDefault "/home/mous";

    stateVersion = "22.05";
  };
}
