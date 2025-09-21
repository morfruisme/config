{ ... }:

{
  programs.fish.enable = true;
  
  programs.kitty = {  
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      "map ctrl+shift+enter" = "new_window_with_cwd";
      "enable_audio_bell" = false;
    };
    themeFile = "Hybrid";
  };
}
