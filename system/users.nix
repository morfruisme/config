{ pkgs, ... }:

{
  users.groups.fruit = {};
  
  users.defaultUserShell = pkgs.zsh;

  users.users.fruit = {
    isNormalUser = true;
    group = "fruit";
    extraGroups = [
      "wheel"
      "seat"
      "networkmanager"
      "video"
      "audio"
      "realtime"
      "pipewire"
      "wireshark"
    ];
    useDefaultShell = true;
  };
}
