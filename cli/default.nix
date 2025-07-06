{ lib, pkgs, ... }:

{
  programs.zsh.enable = true;

  programs.starship = {
    enable = false;
    enableZshIntegration = true;

    settings = {
      character = {
        success_symbol = " >(white)";
        error_symbol = " >(white)";
      };
    };
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
