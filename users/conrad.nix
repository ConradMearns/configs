{ pkgs, ... }:

{
  users.users.conrad = {
    isNormalUser = true;
    description = "conrad";
    extraGroups = [ "networkmanager" "wheel" ];

    hashedPassword = "$6$39j2jdc4JNJc1rTa$MNEF0nlTt1za5ifoaUVVsZ6suq29LKgLYcodHk3h0cFFJYAlDwQwAEyJ4puJ0.B1.gdBZ6JtIRepS0qBX8GQZ0";

    packages = with pkgs; [
      firefox
      gh
      vscode
      google-chrome
      nodejs
      python3
    ];
  };
}
