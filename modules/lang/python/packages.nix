{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python314.withPackages (ps: with ps; [
      # global libraries

    ]))

    # global tools

  ];
}
