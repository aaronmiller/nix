{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_26

    # global tools

  ];
}
