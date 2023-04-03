{ pkgs, ...}: 
{

  # environment.systemPackages = [  ];
  services.deluge.enable = true;
  services.deluge.web = true;

}
