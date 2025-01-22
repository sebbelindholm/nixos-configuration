{
  config,
  pkgs,
  inputs,
  ...
}:

{
  networking = {
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "enp0s31f6";
    };
  };

  containers.ai = {
    autoStart = true;
    privateNetwork = true;
    localAddress = "192.168.0.111";
    hostAddress = "192.168.0.106";

    config =
      {
        config,
        pkgs,
        lib,
        ...
      }:

      {
        environment.systemPackages = with pkgs; [
          neofetch
        ];

        services.open-webui = {
          enable = true;
          openFirewall = true;
          port = 8080;
          host = "192.168.0.111";
          environment.OLLAMA_API_BASE_URL = "http://localhost:11434";
        };

        services.ollama = {
          enable = true;
          loadModels = [
            "phi3"
          ];
          acceleration = "rocm";

          environmentVariables = {
            HCC_AMDGPU_TARGET = "gfx1102"; # used to be necessary, but doesn't seem to anymore
            OLLAMA_KEEP_ALIVE = "30";
          };
          rocmOverrideGfx = "11.0.0";

        };

        system.stateVersion = "23.11";

        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [ 8080 ];
          };
          # Use systemd-resolved inside the container
          # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
          useHostResolvConf = lib.mkForce false;
        };

        services.resolved.enable = true;

      };
  };
}
