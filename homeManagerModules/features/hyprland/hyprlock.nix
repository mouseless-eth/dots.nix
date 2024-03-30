{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    backgrounds = [
      {
        path = "screenshot";
        blur_passes = 2;
        blur_size = 2;
      }
    ];
    input-fields = [
      {
        outer_color = "rgb(f2faea)";
        inner_color = "rgb(f2faea)";
        font_color = "rgb(98eca4)";
        size = {
          width = 600;
          height = 80;
        };
        placeholder_text = "";
      }
    ];
    labels = [
      {
        text = "Hi there, $USER";
        color = "rgb(138, 225, 128)";
        font_size = 45;
        font_family = "Mono";
        position = {
          x = 0;
          y = 100;
        };
      }
      {
        text = "$TIME";
        color = "rgb(138, 225, 128)";
        font_size = 100;
        font_family = "Mono";
        position = {
          x = 0;
          y = 200;
        };
      }
    ];
  };
}
