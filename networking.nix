{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [
      "127.0.0.53"
    ];
    defaultGateway = "192.168.137.1";
    defaultGateway6 = "";
    dhcpcd.enable = true;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      enp3s0 = {
        ipv4.addresses = [
          { address="192.168.137.92"; prefixLength=24; }
        ];
        ipv6.addresses = [
          { address="fe80::dad3:753a:d364:4f39"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "192.168.137.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = ""; prefixLength = 32; } ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="d4:be:d9:eb:34:b8", NAME="enp3s0"
    ATTR{address}=="42:ca:7f:02:9a:9c", NAME="zt44xctfjm"
  '';
}
