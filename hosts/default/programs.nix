{ pkgs, inputs, system, ... }:
{

  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
    adb = {
      enable = true;
    };
    kdeconnect = {
      enable = true;
    };

    lazygit.enable = true;
    git = {
      enable = true;
    };

    hyprlock = {
      enable = true;
    };
    neovim = {
      enable = true;
      withNodeJs = true;
      viAlias = true;
      withPython3 = true;
    };
    tmux = {
      enable = true;
      terminal = "screen-256color";
      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      keyMode = "vi";
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      autosuggestions = { enable = true; };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };


  environment.systemPackages = with pkgs; [
    android-studio
    androidenv.androidPkgs.platform-tools
    ani-cli
    blueman
    brightnessctl
    bzip2
    cmake
    dbeaver-bin
    direnv
    docker-compose
    dunst
    eza
    firefox
    font-awesome
    fzf
    gimp
    git
    gnumake
    gnutar
    go
    google-chrome
    gzip
    hypridle
    hyprshot
    imagemagick
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${system}".default
    kanata
    kitty
    lazydocker
    libinput
    libreoffice
    nodejs
    nwg-look
    obs-studio
    obsidian
    openssh
    p7zip
    pamixer
    pavucontrol
    playerctl
    pnpm
    pulseaudioFull
    python3
    pywal
    ripgrep
    rofi
    rustup
    spotify
    stow
    swww
    tableplus
    tmux
    unrar
    unzip
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vimPlugins.telescope-fzf-native-nvim
    waybar
    wget
    wl-clipboard
    wlogout
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.thunar-volman
    xorg.libX11
    yazi
    zoom-us
    zoxide
    zsh-powerlevel10k
    catppuccin-gtk
  ];
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "gtk" "hyprland" ];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
