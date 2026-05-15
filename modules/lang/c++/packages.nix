{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake

    # global tools

  ];
}
