{
  services = {
    pipewire.extraConfig.pipewire = {
      "11-virtual-devices" = {
        "context.modules" = [
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "TTS Virtual Microphone";
              "capture.props" = {
                "node.name" = "tts_sink";
                "node.description" = "TTS Sink";
                "media.class" = "Audio/Sink";
              };
              "playback.props" = {
                "node.name" = "tts_source";
                "node.description" = "TTS Source";
                "media.class" = "Audio/Source";
              };
              "audio.position" = [ "FL" "FR" ]; # Required, for some reason
            };
          }
        ];
      };
    };
  };
}