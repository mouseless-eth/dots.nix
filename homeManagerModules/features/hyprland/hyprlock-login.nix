{config, ...}: {
  xdg.configFile."/home/mous/.config/hypr/hyprlock-login.conf" = {
    executable = false;
    text = ''

      general {
        disable_loading_bar = false
        grace = 0
        hide_cursor = true
        no_fade_in = false
        no_fade_out = false
        ignore_empty_input = false
      }

      background {
        path = /home/${config.home.username}/.snowstorm/homeManagerModules/features/images/schizo.png
        color = rgba(25, 20, 20, 1.0)
        blur_size = 0
        blur_passes = 0
        noise = 0.011700
        contrast = 0.891700
        brightness = 0.817200
        vibrancy = 0.168600
        vibrancy_darkness = 0.050000
      }

      input-field {
        monitor =
        size = 600, 80
        outline_thickness = 0
        dots_size = 0.330000
        dots_spacing = 0.150000
        dots_center = true
        dots_rounding = -1
        outer_color = rgb(eae6e5)
        inner_color = rgb(eae6e5)
        font_color = rgb(a1cca5)
        fade_on_empty = true
        fade_timeout = 1000
        placeholder_text =
        hide_input = false
        rounding = -1
        shadow_passes = 0
        shadow_size = 3
        shadow_color = rgba(0, 0, 0, 1.0)
        shadow_boost = 1.200000
        check_color = rgb(204, 136, 34)
        fail_color = rgb(204, 34, 34)
        fail_text = <i>$FAIL</i>
        fail_transition = 300
        capslock_color = -1
        numlock_color = -1
        bothlock_color = -1
        invert_numlock = false
        swap_font_color = false

        position = 0, -20
        halign = center
        valign = center
      }

      label {
        monitor =
        text =
        color = rgb(138, 225, 128)
        font_size = 45
        font_family = Mono
        rotate = 0.000000
        shadow_passes = 0
        shadow_size = 3
        shadow_color = rgba(0, 0, 0, 1.0)
        shadow_boost = 1.200000

        position = 0, 100
        halign = center
        valign = center
      }

      label {
        monitor =
        text =
        color = rgb(138, 225, 128)
        font_size = 100
        font_family = Mono
        rotate = 0.000000
        shadow_passes = 0
        shadow_size = 3
        shadow_color = rgba(0, 0, 0, 1.0)
        shadow_boost = 1.200000

        position = 0, 200
        halign = center
        valign = center
      }
    '';
  };
}
