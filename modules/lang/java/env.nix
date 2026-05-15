{ pkgs, ... }:

{
  environment.variables = {
    JAVA_HOME = "${pkgs.jdk21}/lib/openjdk";
  };
}
