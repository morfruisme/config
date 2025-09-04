{ lib, pkgs, ... }:

{  
  programs.helix = {
    enable = true;
    defaultEditor = true;
  
    settings.editor = {
      line-number = "relative";
      auto-format = true;

      soft-wrap = {
        enable = true;
        wrap-indicator = "";
      };

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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jdinhlife.gruvbox
      rust-lang.rust-analyzer
      llvm-vs-code-extensions.vscode-clangd
      haskell.haskell
    ];
  };
}
