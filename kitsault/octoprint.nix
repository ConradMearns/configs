{ pkgs, ...}: 
{

  environment.systemPackages = with pkgs; [ mjpg-streamer v4l-utils ];
  services.octoprint.enable = true;
  services.octoprint.plugins = plugins: with plugins; [
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/misc/octoprint/plugins.nix
    stlviewer
    bedlevelvisualizer
    displaylayerprogress
    octoprint-dashboard
    displayprogress
    themeify
    touchui
    printtimegenius
    costestimation
  ];
  
  systemd.services.octostream = {
    serviceConfig = {
      ExecStart = "${pkgs.mjpg-streamer}/bin/mjpg_streamer -i \"input_uvc.so -r 640x480 -d /dev/video0 -f 30 -n\" -o \"output_http.so -p 8080 -w /usr/local/share/mjpg-streamer/www\"";
    };
    wantedBy = [ "default.target" ];
  };
 
}
