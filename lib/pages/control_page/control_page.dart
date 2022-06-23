import 'package:actionkids/state/settings_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octo_image/octo_image.dart';
import 'package:just_audio/just_audio.dart';
import '/pages/widgets/base_page.dart';
import '/pages/widgets/bottom_appbar.dart';
import '/state/audio_providers.dart';
import '/state/programme_providers.dart';
import '/data/models/module_model.dart';
import '/data/models/audio_tag_model.dart';
import 'widgets/quit_programme_dialog.dart';
import 'widgets/control_buttons.dart';

class ControlLoad extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<AudioPlayer> player = watch(audioProvider);

    return player.when(
      loading: () => BasePage(
        title: 'På bondegården',
        child: Center(child: const CircularProgressIndicator()),
      ),
      error: (err, stack) => BasePage(
        title: 'På bondegården',
        child: Center(child: Text('Error: $err')),
      ),
      data: (player) {
        return ControlPage(player: player);
      },
    );
  }
}

class ControlPage extends StatelessWidget {
  ControlPage({required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    player.play();

    return QuitProgrammeDialog(
      player: player,
      child: StreamBuilder<SequenceState?>(
        stream: player.sequenceStateStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return BasePage(
              title: 'På bondegården',
              child: CircularProgressIndicator(),
            );
          else {
            final currentSource = snapshot.data!.currentSource!;
            final meta = currentSource.tag as AudioTag;

            return Consumer(
              builder: (context, watch, child) {
                List<Module> modules = watch(selectedModulesProvider);
                Module module = modules.firstWhere((m) => m.id == meta.id);
                int moduleIndex = modules.indexOf(module);
                bool isFirst = modules[moduleIndex] == modules.first;
                bool isLast = modules[moduleIndex] == modules.last;

                bool isAutomatic = watch(isAutomaticProvider).state;
                bool isModuleTextOn = watch(isModuleTextOnProvider).state;
                bool isModuleTitleOn = watch(isModuleTitleOnProvider).state;
                bool isBackgroundOn = watch(isBackgroundOnProvider).state;

                if (meta.type == 'loop' && !isAutomatic)
                  player.setLoopMode(LoopMode.one);
                else
                  player.setLoopMode(LoopMode.off);

                Module getPreviousModule() {
                  if (!isFirst)
                    return modules[moduleIndex - 1];
                  else
                    return module;
                }

                Module getNextModule() {
                  if (!isLast)
                    return modules[moduleIndex + 1];
                  else
                    return module;
                }

                return BasePage(
                  title: 'På bondegården',
                  ignoreMargin: true,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isBackgroundOn)
                        Container(
                          //height: 2400,
                          //width: 1600,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: OctoImage(
                                image: AssetImage(module.backgroundPath),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  module.blurHash,
                                ),
                                fadeInDuration: Duration(milliseconds: 20),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        constraints: BoxConstraints(
                          maxWidth: 600,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isModuleTitleOn)
                              Text(
                                '${module.title}',
                                style: Theme.of(context).textTheme.headline1,
                                textAlign: TextAlign.center,
                              ),
                            if (isModuleTextOn) ...[
                              SizedBox(height: 20),
                              //if (isAutomatic) ...[
                              //  Text(
                              //    '0m : 00s',
                              //    style: Theme.of(context).textTheme.headline2,
                              //  ),
                              //  SizedBox(height: 50),
                              //],
                              Text(
                                '${module.description}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(height: 80),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomBar: AKBottomAppBar(
                    children: [
                      ControlButtons(
                        isFirst: isFirst,
                        player: player,
                        isLast: isLast,
                        module: module,
                        previousModule: getPreviousModule(),
                        nextModule: getNextModule(),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
