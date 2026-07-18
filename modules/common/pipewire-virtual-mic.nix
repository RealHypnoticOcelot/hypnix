{
  services = {
    pipewire.extraConfig.pipewire = {
      "11-virtual-devices" = {
        "context.modules" = [
          {
            name = "libpipewire-module-null-audio-sink";
            args = {
              "node.name" = "tts_sink";
              "node.description" = "TTS Sink";
              "media.class" = "Audio/Sink";
              "audio.position" = [ "FL" "FR" ];
            };
          }
          {
            "name" = "libpipewire-module-loopback";
            "args" = {
              "capture.props" = {
                "node.name" = "tts_sink_monitor";
                "media.class" = "Audio/Sink";
                "target.object" = "tts_sink";
              };
              "playback.props" = {
                "node.name" = "virtual_mic";
                "node.description" = "Virtual Microphone";
                "media.class" = "Audio/Source"
              };
            };
          }
        ]
      }
    }
  };
}