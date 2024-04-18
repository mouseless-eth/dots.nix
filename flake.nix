{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #ollama = {
    #  url = "github:abysssol/ollama-flake";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  inputs.utils.follows = "utils";
    #};

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    foundry = {
      url = "github:shazow/foundry.nix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";

    xdg-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {...} @ inputs: let
    myLib = import ./myLib/default.nix {inherit inputs;};
  in
    with myLib; {
      nixosConfigurations = {
        mini-itx = mkSystem ./hosts/mini-itx/configuration.nix;
        thinkpad-e14 = mkSystem ./hosts/thinkpad-e14/configuration.nix;
      };

      homeConfigurations = {
        "mous@mini-itx" = mkHome "x86_64-linux" ./hosts/mini-itx/home.nix;
        "mous@thinkpad-e14" = mkHome "x86_64-linux" ./hosts/thinkpad-e14/home.nix;
      };

      homeManagerModules.default = ./homeManagerModules;
      nixosModules.default = ./nixosModules;
    };
}
