{ lib
, config
, inputs
, outputs
, myLib
, pkgs
, ...
}:
let
  cfg = config.myNixOS;
in
{
  options.myNixOS = {
    userName = lib.mkOption {
      default = "mous";
      description = ''
        username
      '';
    };

    userConfig = lib.mkOption {
      default = ./../../home-manager/work.nix;
      description = ''
        home-manager config path
      '';
    };

    userNixosSettings = lib.mkOption {
      default = { };
      description = ''
        NixOS user settings
      '';
    };
  };

  config = {
    programs.fish.enable = true;
    programs.hyprland.enable = true;

    home-manager = {
      extraSpecialArgs = {
        inherit inputs;
        inherit myLib;
        outputs = inputs.self.outputs;
      };
      users = {
        ${cfg.userName} = { ... }: {
          imports = [
            (import cfg.userConfig)
            outputs.homeManagerModules.default
          ];
        };
      };
    };

    users.mutableUsers = true;
    users.users.${cfg.userName} =
      {
        isNormalUser = true;
        initialPassword = "1337";
        description = cfg.userName;
        shell = pkgs.fish;
        extraGroups = [ "renderer" "libvirtd" "networkmanager" "wheel" "video" "audio" "network" "docker" "seat" ];

        packages = [ pkgs.home-manager ];
      }
      // cfg.userNixosSettings;
  };
}
