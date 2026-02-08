{ ... }:

{
  networking.hostName = "germaine";
  networking.networkmanager.enable = true;

  # match nicotine+ port
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 17000 ];
    allowedUDPPorts = [ 17000 ];
  };
}
