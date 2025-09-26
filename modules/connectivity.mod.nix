{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = ["10.0.10.10/32"];
      privateKeyFile = "/root/wireguard-keys/privatekey";

      peers = [
        {
          publicKey = "j1o8gFXE6XH+7pq1a4pVBU4VkWzMHDyEUXAz7+XURGk=";
          allowedIPs = ["10.0.10.1/32"];
          endpoint = "103.249.237.235:51820";
          persistentKeepalive = 21;
        }
        {
          publicKey = "fb2/Tw/nrkNO6xHPRu6Gikfe9vrz3Wt+rPQXkN0xdy8=";
          allowedIPs = ["10.0.10.2/32"];
          endpoint = "43.224.182.81:51820";
          persistentKeepalive = 21;
        }
      ];
    };
  };

  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
    settings = {
      General = {
        Privacy = "device";
        JustWorksRepairing = "always";
        Class = "0x000100";
        FastConnectable = "true";
      };
    };
  };
}
