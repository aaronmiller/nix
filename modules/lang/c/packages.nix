{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake

    # global tools

  ];
}
