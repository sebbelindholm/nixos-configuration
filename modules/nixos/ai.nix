{
  lib,
  config,
  pkgs,
  ...
}:
{
  services.open-webui = {
    enable = true;
    openFirewall = true;
    port = 8080;
    host = "192.168.0.106";
    environment.OLLAMA_API_BASE_URL = "http://localhost:11434";
  };
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1102"; # used to be necessary, but doesn't seem to anymore
    };
    rocmOverrideGfx = "11.0.0";
  };
}
