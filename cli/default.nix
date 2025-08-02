{ lib, pkgs, ... }:

{
  programs.kitty = {  
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      "map ctrl+shift+enter" = "new_window_with_cwd";
    };
    themeFile = "Hybrid";
  };

  programs.zsh.enable = true;
  
  programs.helix = {
    enable = true;
    defaultEditor = true;
  
    settings.editor = {
      line-number = "relative";
      auto-format = false;

      cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    settings.theme = "papercolor-light";
  
    languages.language-server = {
      nil.command = "nil";
      c.command = "clangd";
      rust.command = "rust-analyzer";
      python.command = "pylsp";
      javascript.command = "typescript-language-server";
      typescript.command = "typescript-language-server";
      css.command = "vscode-css-languageserver";
      glsl.command = "glsl_analyzer";
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
