{ ... }:

{
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  security.rtkit.enable = true;
}
