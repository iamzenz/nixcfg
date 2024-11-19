#          ╔══════════════════════════════════════════════════════════╗
#          ║                         home.nix                         ║
#          ╚══════════════════════════════════════════════════════════╝


# ══ TODO: ═════════════════════════════════════════════════════════════
#
# - [x] Modularize packages into separate configuration files


# This is a default home.nix generated by the follwing hone-manager command
#
# home-manager init ./

{ config, lib, pkgs, zen-browser, inputs, ... }:

{
  home.packages = with pkgs; [
    # Terminal Emulators
    alacritty # A fast, lightweight terminal emulator

    # Note-taking & Office
    obsidian # A powerful knowledge base that works on local Markdown files
    libreoffice-still # Comprehensive, professional-quality productivity suite, a variant of openoffice.org
    doing

    # Email Clients
    thunderbird # A free and open-source email, newsfeed, chat, and calendaring client

    # Web Browsers
    firefox # A free and open-source web browser

    # Version Control
    gh # GitHub’s official command line tool
    git # The fast distributed version control system
    lazygit # Simple terminal UI for git commands

    # Terminal Multiplexers
    tmux # Terminal multiplexer

    # Media
    plexamp # A music player for Plex Pass users

    # Formatting Tools
    alejandra # A code formatter for Nix

    # Shells
    fish # Friendly interactive shell

    # Command History
    atuin # Replaces your existing shell history

    # Utilities
    bat # A cat clone with syntax highlighting
    ncdu # Disk usage analyzer with an ncurses interface
    plocate # A locate command implementation
    zoxide # A smarter cd command
    bottom # A graphical process/system monitor for the terminal
    python312 # Python programming language
    python312Packages.numpy
    python3
    neofetch # A command-line system information tool
    nnn # Terminal file manager
    thefuck # Correct your commands
    copyq
    curl
    planify
    cmake
    ninja
    gcc

    # Archives
    zip # Package and compress (archive) files
    xz # Lossless data compression
    unzip # Decompression program for .zip files
    p7zip # Command-line version of 7-Zip

    # Search Utilities
    ripgrep # Recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # Networking Tools
    nmap # A utility for network discovery and security auditing

    # Miscellaneous
    nixd
    cowsay # Configurable talking cow
    sl
    nyancat
    file # Determines file type
    which # Shows the full path of (shell
    tree # Displays directories as trees (with optional color/HTML output)

# Nix Related
    nix-output-monitor # Monitor for nix builds

# Productivity
    hugo # Static site generator
    yazi
    file
    kitty

    nodejs
    nodejs_22
    lua # Lua programming language
    luarocks
    direnv # Environment switcher for the shell
    nix-direnv # direnv integration for nix

    inputs.zen-browser.packages."${system}".specific # Zen Browser
    marksman

    neovim
    # streamrip
    neomutt

    starship # The minimal, blazing-fast, and infinitely customizable prompt for any shell

    fastfetch
    rsync # A fast, versatile, remote (and local) file-copying tool
    duplicati # Free backup software to store encrypted backups online
    taskwarrior3 # Taskwarrior is Free and Open Source Software that manages your TODO list from the command line
    spotify
    devenv
    cowsay
    ponysay

    darktable
    gimp
    go
    poetry
    wofi

    cheat
    tldr
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = lib.mkDefault "mike";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home = {
    stateVersion = "24.05";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/m3tam3re/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    # Basic configuration of git
    git = {
      enable = true;
      userName = "mike";
      userEmail = "mikehall@mikehall94.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "home/mike/dotfiles";
      };
    };


    direnv = {
      enable = true;
      nix-direnv.enable = true;
      # enableFishIntegration = true;
    };

    home-manager.enable = true;

  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
