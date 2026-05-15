{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ruby_4_0

    # global tools

  ];
}
