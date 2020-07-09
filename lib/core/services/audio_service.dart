import 'package:audioplayers/audio_cache.dart';

class AudioService {
  AudioCache audioCache = new AudioCache();
  String endAudioPath = "audios/end.mp3";

  String startAudioPath = "audios/start.wav";

  playAudioFromLocalStorage() async {
    AudioCache player = AudioCache();
    await player.play(startAudioPath);
  }
}
