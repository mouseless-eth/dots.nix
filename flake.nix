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

    #waybar = {
    #  url = "github:Alexays/waybar";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

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
      url = "github:shazow/foundry.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland/fe7b748eb668136dd0558b7c8279bfcd7ab4d759";
      #url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
