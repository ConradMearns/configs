{ pkgs, ...}: 
{

  # environment.systemPackages = [  ];
  services.deluge = {
    enable = true;
    dataDir = "/store/delugeData";
    web.enable = true;
  };

}
