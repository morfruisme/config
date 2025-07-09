{ lib, pkgs, ... }:

{
  programs.zsh.enable = true;

  programs.neovim.enable = true;

  programs.helix = {
    enable = true;
    defaultEditor = true;
  
    settings.editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
  
    languages.language-server = {
      nil.command = "nil";
      c.command = "clangd";
      rust.command = "rust-analyzer";
      python.command = "pylsp";
      javascript.command = "typescript-language-server";
      typescript.command = "typescript-language-server";
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
