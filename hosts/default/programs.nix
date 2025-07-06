{ pkgs, inputs, system, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

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
      extraConfig = {
        user.name = "sharon504";
        user.email = "sharonpshajan@gmail.com";
      };
    };

    hyprlock = {
      enable = true;
    };
    kitty = {
      enable = true;
    };
    neovim = {
      enable = true;
      withNodeJs = true;
      viAlias = true;
      withPython3 = true;
      extraPackages = with pkgs; [
        gcc
        cmake
        gnumake
      ];
    };
    rofi = {
      enalbe = true;
    };
    tmux = {

      enable = true;
      terminal = "screen-256color";
      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      mouse = true;
      keyMode = "vi";
      shell = null;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        battery
        resurrect
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_window_status_style "basic"

            # Make sure Catppuccin shows window names (#W), not commands
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_text "#W"

            # Optional: display status segments
            set -g status-right "#{E:@catppuccin_status_application} #{E:@catppuccin_status_gitmux} #{E:@catppuccin_status_user}"
          '';
        }
      ];
      zsh = {
        programs.zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
          plugins = [
            {
              name = "powerlevel10k";
              src = pkgs.zsh-powerlevel10k;
            }
            {
              name = "zsh-autosuggestions";
              src = pkgs.zsh-autosuggestions;
            }
            {
              name = "zsh-syntax-highlighting";
              src = pkgs.zsh-syntax-highlighting;
            }
            {
              name = "zsh-nix-shell";
              src = pkgs.zsh-nix-shell;
            }
          ];
        };

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
    eza
    firefox
    font-awesome
    fzf
    gimp
    git
    gnumake
    gnutar
    google-chrome
    gzip
    hypridle
    hyprshot
    imagemagick
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${system}".default
    kitty
    kitty
    lazydocker
    libreoffice
    nodejs
    nwg-look
    obs-studio
    p7zip
    pamixer
    pavucontrol
    playerctl
    pnpm
    pulseaudioFull
    python3
    pywal
    ripgrep
    rustup
    spotify
    swww
    tmux
    unrar
    unzip
    unzip
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vimPlugins.telescope-fzf-native-nvim
    wget
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.thunar-volman
    xorg.libX11
    yazi
    zoom-us
    zoxide
  ];
  gtk = {
    enable = true;
    theme = {
      name = "fluent-gtk-theme";
      package = pkgs.fluent-gtk-theme;
    };
    iconTheme = {
      name = "fluent-icon-theme";
      package = pkgs.fluent-icon-theme;
    };
  };
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
