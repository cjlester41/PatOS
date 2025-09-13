{ config, pkgs, inputs, lib, ... }:

{
  imports = [ 
    
    ./fastfetch  
    ./waybar.nix
    ./kitty.nix
    # ./micro.nix
    ./rofi.nix
    # ./nemo.nix
    # ./cava.nix
    # ./git.nix
    ./vscode
    ./swaync.nix
    ./wayfire
    ./zsh
  ];

  
  # ...other config, other config...

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    zsh.enable = true; # see note on other shells below
  };

#   # Let Home Manager install and manage itself.
#   programs.home-manager.enable = true;
}
