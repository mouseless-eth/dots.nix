{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.ethereum-nix.overlays.default
  ];

  fileSystems = {
    "/mount/sdb1-4tb" = {
      device = "/dev/disk/by-uuid/0a86009f-9f72-473c-828b-15dad32db1c4";
      fsType = "ext4";
      depends = [
        "/"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "Z /mount/sdb1-4tb 0770 metapod wheel - -"
  ];

  users.users.metapod = {
    isNormalUser = true;
    createHome = true;
    home = "/mount/sdb1-4tb/home/metapod";
    shell = "/bin/false";
  };

  environment.systemPackages = with pkgs; [
    reth
    lighthouse
  ];

  systemd.services.reth = {
    enable = true;
    description = "RETH";
    after = ["network.target"];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      User = "metapod";
      RestartSec = 1;
      ExecStart = ''
        ${pkgs.reth} node \
          --metrics 0.0.0.0:9002 \
          --authrpc.jwtsecret /secrets/jwt.hex \
          --authrpc.addr 127.0.0.1 \
          --authrpc.port 8551 \
          --http \
          --ws \
          --rpc-max-connections 429496729 \
          --http.api trace,web3,eth,debug \
          --ws.api trace,web3,eth,debug
      '';
    };
    wantedBy = ["multi-user.target"];
  };
}
