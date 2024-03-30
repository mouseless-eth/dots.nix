{ pkgs
, inputs
, ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];
  programs.hyprlock = {
    enable = true;
    backgrounds = [
      {
        path = "screenshot";
        blur_passes = 2;
        blur_size = 2;
      }
    ];
    input-fields = [
      {
        outer_color = "rgb(eae6e5)";
        inner_color = "rgb(eae6e5)";
        font_color = "rgb(a1cca5)";
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
