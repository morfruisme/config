{ lib, pkgs, ... }:

{
  home.username = "fruit";
  home.homeDirectory = "/home/fruit";
  
  home.stateVersion = "25.05";
  
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "fruit";
    userEmail = "nico.travert@gmail.com";
  };

  programs.helix = {
    enable = true;
    settings.editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
    languages.language-server = {
      nil.command = "nil";
      qmlls = {
        command = "qmlls";
        args =
          lib.foldl (acc: pkg: acc ++ [ "-I" "${pkg}/lib/qt-6/qml" ])
          []
          (with pkgs; [ qt6.qtdeclarative quickshell ]);
      };
    };
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.kitty.enable = true;
  programs.vesktop.enable = true;
  programs.yazi.enable = true;

  qt.enable = true;
  qt.style.name = "adwaita";

  home.packages = with pkgs; [
    app2unit
    aubio
    bibata-cursors
    caelestia-cli
    cava
    grim
    inotify-tools
    libqalculate
    material-symbols
    nautilus
    nerd-fonts.jetbrains-mono
    nil
    qt6.qtdeclarative
    quickshell
    swappy
  ];
}
