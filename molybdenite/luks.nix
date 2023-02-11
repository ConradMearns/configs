{
    # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-5705b00f-8591-45c9-99d6-c1c2e54040cb".device = "/dev/disk/by-uuid/5705b00f-8591-45c9-99d6-c1c2e54040cb";
  boot.initrd.luks.devices."luks-5705b00f-8591-45c9-99d6-c1c2e54040cb".keyFile = "/crypto_keyfile.bin";

}