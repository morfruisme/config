{ lib, pkgs, ... }:

{
  # not used yet
  home.file.".config/helix/themes/custom.toml".text = ''
    inherits = "seoul256-light"
    "ui.cursor.insert" = "#000000"
  '';
  
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
        insert = "block";
        select = "underline";
      };
    };

    settings.keys.normal.space = {
      f = "file_picker_in_current_directory";
      F = "file_picker";
    };

    settings.theme = "seoul256-light";
  
    languages.language-server = {
      nil.command = "nil";
      c.command = "clangd";
      rust.command = "rust-analyzer";
      haskell.command = "haskell-language-server";
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
