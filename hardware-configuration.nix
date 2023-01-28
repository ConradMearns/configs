{ config, ... }:
{
  #imports = [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix> ];
  boot.loader.grub.device = "/dev/sda";
  fileSystems."/" = { device = "/dev/sda5"; fsType = "ext4"; };
  boot.blacklistedKernelModules = [ "rtl8xxxu" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8814au ];
  # boot.kernelModules = [ "8814au" ];
}
