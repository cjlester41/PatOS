{
  pkgs,
  inputs,
  config,
  ...
}:

{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {hostnm = config.networking.hostName;};#inherit inputs username host profile;};
    users.ppierce = { #${username} = {
      imports = [./home];
      home = {
        username = "ppierce"; #"${username}";
        homeDirectory = "/home/ppierce"; #${username}";
        stateVersion = "24.11";
        # programs.home-manager.enable = true;
      };
    };
  };

  users.users.ppierce = {
    isNormalUser = true;
    description = "ppierce";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "audio" 
      "gamemode" 
      "video" 
      "libvirtd"
      "storage"
      "dailout"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = false;
  };

  nix.settings.allowed-users = ["ppierce"]; 
}
