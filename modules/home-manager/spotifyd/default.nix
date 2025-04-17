{
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "alpha_504";
        password = builtins.readFile ./.password.text;
        device_name = "alpha";
      };
    };
  };
}
