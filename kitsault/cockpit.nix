{ pkgs, ...}: 
{
  environment.systemPackages =  with pkgs; [
    cockpit
  ];
}
