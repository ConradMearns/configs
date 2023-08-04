{ config, pkgs, ... }:
{
  imports =
    [
      ./samba-client.nix     
      ./hardware-configuration.nix     
    ];


# VIRT-MAN
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  #environment.systemPackages = with pkgs; [virt-manager];


# Syncthing
#  services.syncthing = {
#    enable = true;
#    user = "conrad";
#    dataDir = "/home/conrad/Documents";
#    configDir = "/home/conrad/Documents/.config/syncthing";
#  };

# ADB
  programs.adb.enable = true;
  # users.users.<your-user>.extraGroups = ["adbusers"];

  # # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # # Setup keyfile
  # boot.initrd.secrets = {
  #   "/crypto_keyfile.bin" = null;
  # };






  networking.hostName = "molybdenite";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.utf8";

  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   virt-manager
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   libusb
   rtl-sdr
   gqrx
   usbutils
   pciutils
   cura
  #  python311
  #  unstable.python311Packages.tiktoken
  #  wget
  ];

  services.udev.packages = [ pkgs.rtl-sdr ];
  hardware.rtl-sdr.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };

  # Dell XPS
  services.xserver.videoDrivers = [ "nvidia" "intel" ];
  # services.xserver.videoDrivers = [ "displaylink" ];




  # services.xserver.libinput.touchpad.disableWhileTyping = false;

  boot.kernelParams = [ "psmouse.synaptics_intertouch=0" "i915.force_probe=8a52" ];
  services.xserver.displayManager.sddm.enableHidpi = true;
  
  system.stateVersion = "22.03"; # Did you read the comment?
}
