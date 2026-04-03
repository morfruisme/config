{ lib, pkgs, ... }:

{
  # not used
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
