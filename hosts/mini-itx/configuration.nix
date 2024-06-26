{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];

  myNixOS = {
    bundles.general-desktop.enable = true;
    bundles.home-manager.enable = true;
    services.ssh.enable = true;

    pipewire.enable = true;

    userName = "mous";
    userConfig = ./home.nix;
    userNixosSettings = {
      extraGroups = ["networkmanager" "wheel" "libvirtd" "docker" "audio" "video"];
    };
  };

  virtualisation.docker.enable = true;

  networking.hostName = "mini-itx";

  services.xserver.videoDrivers = ["modesetting"];
  boot = {
    kernelModules = ["amdgpu"];
    loader.grub = {
      enable = true;
      device = "/dev/nvme1n1";
    };
  };

  #fileSystems = {
  #  "/mount/nvme0n1-2tb" = {
  #    device = "/dev/disk/by-uuid/b12343e8-172e-45af-ac13-d64088bd0d2b";
  #    fsType = "ext4";
  #    depends = [
  #      "/"
  #    ];
  #  };
  #};

  #systemd.tmpfiles.rules = [
  #  "d /mount/nvme0n1-2tb 0777 root root -"
  #];

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  xdg.portal.enable = true;

  programs.fish.enable = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [amdvlk rocmPackages.clr.icd];
    };
  };

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  system.stateVersion = "23.11";
}
