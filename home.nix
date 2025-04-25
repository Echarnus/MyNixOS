{ lib, config, pkgs, ... }:
{
  home.username = "kennethdc";
  home.homeDirectory = "/home/kennethdc";

  imports = [
    ./modules/gnomeExtensions
  ];

  home.packages = with pkgs; [ 
    pkgs.oh-my-zsh

    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # productivity
    glow # markdown previewer in terminal

    # ide
    vscode

    # utility
    postman

    # browser
    vivaldi

    # gaming
    steam

    # mail
    thunderbird
    
    # social
    discord

    # proton
    proton-pass

    # music
    spotify

  ]; 

  
  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Kenneth De Clercq";
    userEmail = "kenneth.de.clercq@pm.me";           
  };

  programs.zsh = {
    enable = true;
  };

#  oh-my-zsh = {
#    enable = true;
#    plugins = [ ];
#    theme = "agnoster";
#  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}