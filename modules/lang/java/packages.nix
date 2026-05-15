{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk21

    # global tools

  ];
}
