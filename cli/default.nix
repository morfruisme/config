{ lib, pkgs, ... }:

{
  home.file.".config/starship/startship.toml".source = ./starship.toml;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {};
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
        args = lib.foldl
          (acc: pkg: acc ++ [ "-I" "${pkg}/lib/qt-6/qml" ])
          []
          (with pkgs; [ qt6.qtdeclarative quickshell ]);
        };
      };
  };
}
