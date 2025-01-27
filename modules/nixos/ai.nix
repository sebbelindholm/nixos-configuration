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
    rocmOverrideGfx = "11.0.0";
    loadModels = [
      "llama3.1"
      "phi4"
    ];
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx1100"; # used to be necessary, but doesn't seem to anymore
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
      OLLAMA_KEEP_ALIVE = "30";
    };
  };
}
