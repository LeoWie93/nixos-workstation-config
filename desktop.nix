{
  config,
  pkgs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    #withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wofi
    ghostty
    thunar
    hypridle
    hyprlock
    hyprshutdown
    brightnessctl
    solaar
    noctalia
  ];
}
