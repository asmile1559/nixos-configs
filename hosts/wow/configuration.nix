# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./services
      ./programs/system
      inputs.home-manager.nixosModules.home-manager
      inputs.nixvim.nixosModules.nixvim
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "wow"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };
  
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      qt6Packages.fcitx5-chinese-addons
    ];
    fcitx5.waylandFrontend = true;
  };
  nix.settings.substituters = [
    "https://mirror.nju.edu.cn/nix-channels/store"
  ];
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dub = {
    isNormalUser = true;
    description = "dub";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vscode
      zotero
    ];
    shell = pkgs.zsh;
    linger = true;
  };

  # home-manager configuration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.dub = import ./home.nix;

    backupFileExtension = "backup";
  };

  # Install firefox.
  programs.firefox.enable = true;
    
  # install zsh
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [
    sarasa-gothic
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
    maple-mono.NL-NF-CN
    corefonts
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Sarasa UI SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
      monospace = [ "Maple Mono NL NF CN" "Fira Code" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  fonts.fontDir.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    tmux
    google-chrome
    clash-verge-rev
    ghostty
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-dock
    gnomeExtensions.caffeine

    mihomo

    nixd
    nixfmt

    fuzzel

    xwayland-satellite
  ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };
  
  services.flatpak = {
    enable = true;
  };

  # nixvim configruation
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [ ./nixvim.nix ];
  };


  # docker
  virtualisation.docker = {
  # Consider disabling the system wide Docker daemon
    enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
      # Optionally customize rootless Docker daemon settings
      daemon.settings = {
        dns = [ "1.1.1.1" "8.8.8.8" ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };

  services.mihomo = {
    enable = true;
    configFile = "/home/dub/.config/mihomo/config-full.yaml";
    tunMode = true;
    webui = pkgs.metacubexd;
  };

  networking.firewall = {
    trustedInterfaces = [
      "Mihomo"
    ];
    checkReversePath = false;
  }; 

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
