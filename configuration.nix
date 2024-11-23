{ inputs, config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the SDDM display manager.
  services.displayManager.sddm.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Hostname.
  networking.hostName = "niki";

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.y = {
    isNormalUser = true;
    description = "y";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      micro
      neovim
      xterm
      vscodium
      zed-editor
      chromium
      librewolf
      git
      vlc
      p7zip
      archiver
      wireshark
      obsidian
      fzf
      bat
      eza
      btop
      fastfetch
      meld
      ripgrep
      tmux
      tldr
      ffmpeg
      gparted
      localsend
      catppuccin-cursors.mochaMauve
    ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [

    # GTK THEMES
    magnetic-catppuccin-gtk

    # KDE STUFF
    krename
    kdePackages.dolphin-plugins
    kdePackages.ark
    kdePackages.kbackup
    kdePackages.kio-admin
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.tokodon
    catppuccin-kde
  ];

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Enable the firewall.
  networking.firewall.enable = true;

  # Open ports in the firewall (localsend).
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];

  # Installation ISO.
  system.stateVersion = "24.05";

  # Automatic Garbage Collection.
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      };

  # Enable fish.
  programs.fish.enable = true;

  # Enable VirtualBox guest
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.seamless = true;
  virtualisation.virtualbox.guest.clipboard = true;

  # Enable virt-manager guest.
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
