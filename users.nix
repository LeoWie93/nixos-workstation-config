{
  pkgs,
  zen-browser,
  ...
}:
{

  services.logind.settings.Login.HandleLidSwitch = "suspend";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "suspend";
  services.logind.settings.Login.HandleLidSwitchDocked = "ignore";

  programs.zsh.enable = true;

  virtualisation.docker = {
    # Disabling the system wide Docker daemon
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
      };
    };
  };

  users.users."lwi" = {
    isNormalUser = true;
    description = "lwi";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      atuin
      bitwarden-desktop
      codex
      grim
      neovim
      nodejs_26
      obsidian
      #python314Packages.jupyterlab
      slurp
      starship
      signal-desktop
      tesseract
      swappy
      jetbrains.idea
      zsh-autosuggestions
      zsh-syntax-highlighting
      antigravity-cli
      vesktop
      yaak
      zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
