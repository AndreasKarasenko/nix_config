{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./shellPackages.nix
    ./bash.nix
  ];

  config = {
    home.stateVersion = "24.11";

    home.username = "andreas";

    home.homeDirectory = "/home/andreas";

    xdg.enable = true;

    xdg.configFile."nix/nix.conf" = {
      enable = true;

      text =
        #nix
        ''

          experimental-features = nix-command flakes

        '';
    };

    catppuccin = {
      enable = true;

      flavor = "mocha";
    };
  };
}
