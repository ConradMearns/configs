{ pkgs, ...}: 
{
  environment.systemPackages = [
    pkgs.cockpit
  ];
}
