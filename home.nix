{pkgs, ...}: {
  imports = [];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cargo
    gcc
  ];

  programs.gh = {
    enable = true;
  };

  programs.git = {
    enable = true;
    aliases = {
      au = "add -u";
      co = "checkout";
      st = "status";
      cmsg = "commit -m";
    };
    userName = "Hugo LUDMANN";
    userEmail = "ludmann.h@protonmail.com";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

  programs.nushell = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      g = "git";
    };
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "screen-256color";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    prefix = "C-Space";
    keyMode = "vi";
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
}
