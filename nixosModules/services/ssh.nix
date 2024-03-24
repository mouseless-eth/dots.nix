{}: {
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  users.users.mous.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJX1aaXfCcqZ1mSmnFvfslKCvdE5oAcEs7/J/bQrERYn 97399882+mouseless-eth@users.noreply.github.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKrBQFkxipTlhXWyUdxoUcjPdWHCetNFlSYFN7NTs9DM"
  ];
}
