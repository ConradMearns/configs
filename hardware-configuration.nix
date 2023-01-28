{ config, ... }:
{
  #imports = [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix> ];
  boot.loader.grub.device = "/dev/sda";
  fileSystems."/" = { device = "/dev/sda5"; fsType = "ext4"; };
  #boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
  boot.kernelModules = [ "8812au" ];
}
