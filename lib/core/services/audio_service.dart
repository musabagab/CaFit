import 'package:audioplayers/audio_cache.dart';

class AudioService {
  String startAudioPath = "audios/start.mp3";
  String doneAudioPath = "audios/done.mp3";
  String takeARestAudio = "audios/take_a_rest.mp3";
  // added all the aduio here
  playStartAudio() async {
    AudioCache player = new AudioCache();

    await player.play(startAudioPath);
  }

  playdoneAudio() async {
    AudioCache player = new AudioCache();

    await player.play(doneAudioPath);
  }

  playTakeARest() async {
    AudioCache player = new AudioCache();

    await player.play(takeARestAudio);
  }
}
