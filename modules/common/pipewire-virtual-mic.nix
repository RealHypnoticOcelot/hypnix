{
  services = {
    pipewire.extraConfig.pipewire = {
      "11-virtual-devices" = {
        "context.modules" = [
          {
            name = "module-null-sink";
            args = {
              "node.name" = "tts_sink";
              "node.description" = "TTS Sink";
              "media.class" = "Audio/Sink";
            };
          }
        ];
      };
    };
  };
}