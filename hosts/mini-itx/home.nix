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
        name = "HDMI-A-1";
        primary = true;
        width = 3840;
        height = 2160;
        refreshRate = 60.0;
        x = 0;
        y = 0;
        scale = 2;
      }
      {
        name = "HDMI-A-2";
        width = 2560;
        height = 1440;
        refreshRate = 60.0;
        x = -720;
        y = 0;
        scale = 2;
        transform = 3;
      }
    ];
  };

  home = {
    username = "mous";
    homeDirectory = lib.mkDefault "/home/mous";

    stateVersion = "22.05";
  };
}
