{
  lib,
  config,
  pkgs,
  ...
}:
{
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
  };
}
