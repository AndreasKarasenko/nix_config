{
  pkgs,
  config,
  lib,
  ...
}: {
  config = {
    home.packages = with pkgs; [
    ];

    programs = {
      bash = {
        enable = true;
        initExtra = ''
          set -o vi

                        eval "$(batpipe)"

                        eval "$(batman --export-env)"

        '';
        shellAliases = {
          cat = "bat";

          grep = "rg";

          cd = "z";

          #lists only directories (no files)

          ldo = "eza -lD";

          #lists only files (no directories)

          lfo = "eza -lf --color=always";

          #lists only hidden files (no directories)

          lho = "eza -dl .* --group-directories-first";

          #lists everything with directories first

          ll = "eza -al --group-directories-first";

          l = "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions";

          #lists everything sorted by time updated

          lt = "eza -al --sort=modified";
        };
      };
      fzf = {
        enableBashIntegration = true;
      };

      zoxide = {
        enableBashIntegration = true;
      };

      starship = {
        enableBashIntegration = true;

        settings = {
          add_newline = false;
        };
      };

      eza = {
        enableBashIntegration = true;

        git = true;
      };

      direnv = {
        enableBashIntegration = true;
      };
    };
  };
}
