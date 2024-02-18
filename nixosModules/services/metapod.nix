{...}: {
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

  systemd.services.lighthouse = {
    enable = true;
    description = "LIGHTHOUSE";
    after = ["network.target"];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      User = "metapod";
      RestartSec = 1;
      ExecStart = ''
        /mount/sdb1-4tb/home/metapod/lighthouse/target/maxperf/lighthouse bn \
          --network mainnet \
          --metrics \
          --execution-endpoint http://localhost:8551 \
          --execution-jwt /mount/sdb1-4tb/home/metapod/secrets/jwt.hex \
          --checkpoint-sync-url https://mainnet.checkpoint.sigp.io \
          --disable-deposit-contract-sync
      '';
    };
    wantedBy = ["multi-user.target"];
  };

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
        /mount/sdb1-4tb/home/metapod/reth/target/maxperf/reth node \
          --full \
          --metrics 0.0.0.0:9002 \
          --authrpc.jwtsecret /mount/sdb1-4tb/home/metapod/secrets/jwt.hex \
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
