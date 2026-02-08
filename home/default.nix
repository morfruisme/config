{ pkgs, ... }:

{
  imports = [
    ./cli.nix
    ./editor.nix
  ];
  
  home.stateVersion = "25.05";
  home.username = "fruit"; # 🦋
  home.homeDirectory = "/home/fruit";

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "fruit";
    userEmail = "nico.travert@gmail.com";
  };
  programs.git-credential-oauth.enable = true;

  programs.firefox.enable = true;
  programs.vesktop.enable = true;
  # programs.qutebrowser.enable = true;
  programs.waybar.enable = true;
  programs.bat.enable = true;
  programs.obs-studio.enable = true;

  programs.swaylock = {  
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      indicator = true;
      clock = true;
      image = "~/Pictures/glt.jpg";
      inside-color = "00000088";
      separator-color = "00000000";
    };
  };
  
  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };
  
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages =
    with pkgs;
    let default = [
      bibata-cursors
      curl
      inotify-tools
      nautilus
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.jetbrains-mono
      unzip
      vlc
      zip
    ];
    programs = [
      aseprite
      gfn-electron
      godot
      inkscape
      libreoffice
      nicotine-plus
      pywal
      qbittorrent
      # stremio
      swaybg
      # woeusb
    ];
    dev = [
      bun
      clang-tools
      gcc
      glsl_analyzer
      gnumake
      haskell.compiler.ghcHEAD
      haskell-language-server
      nil
      qt6.qtdeclarative
      rust-analyzer
      typescript
      typescript-language-server
      vscode-css-languageserver

      (python3.withPackages (pkgs: with pkgs; [
          numpy
          pillow
          pip
          pyshark
          python-lsp-server
        ]))
    ];
    in default ++ programs ++ dev;
}
