import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '/data/models/module_model.dart';
import '../data/models/audio_tag_model.dart';
import 'programme_providers.dart';

final audioProvider = FutureProvider.autoDispose<AudioPlayer>((ref) async {
  final player = AudioPlayer();
  final selectedModules = ref.watch(selectedModulesProvider);

  var playlist = ConcatenatingAudioSource(
    useLazyPreparation: false,
    children: [
      for (Module module in selectedModules) ...[
        if (module.introAudio != '')
          AudioSource.uri(
            Uri.parse('asset:///${module.introAudio}'),
            tag: AudioTag(id: module.id, type: 'intro'),
          ),
        if (module.loopAudio != '')
          LoopingAudioSource(
            child: AudioSource.uri(
              Uri.parse('asset:///${module.loopAudio}'),
              tag: AudioTag(
                id: module.id,
                type: 'loop',
                loopCount: module.loopCount,
              ),
            ),
            count: module.loopCount,
          ),
        if (module.outroAudio != '')
          AudioSource.uri(
            Uri.parse('asset:///${module.outroAudio}'),
            tag: AudioTag(id: module.id, type: 'outro'),
          ),
      ],
    ],
  );

  await player.setAudioSource(playlist, preload: true);

  return player;
});
