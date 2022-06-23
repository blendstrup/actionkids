import 'package:flutter/material.dart';
import '/pages/widgets/base_page.dart';
import '/pages/widgets/bottom_appbar.dart';
import 'widgets/settings_subtitle.dart';
import 'widgets/top_info.dart';
import 'widgets/play_mode.dart';
import 'widgets/sound_settings.dart';
import 'widgets/visual_settings.dart';
import 'widgets/dialog_content.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: 'På bondegården',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              TopInfo(),
              //SizedBox(height: 40),
              SettingsSubtitle(
                subtitle: 'Afspilning',
                dialogTitle: 'Tilpasning af afspilning',
                dialogContent: PlayDialogContent(),
              ),
              PlayMode(),
              SizedBox(height: 10),
              SettingsSubtitle(
                subtitle: 'Lyd',
                dialogTitle: 'Tilpasning af lyd',
                dialogContent: SoundDialogContent(),
              ),
              SoundSettings(),
              SizedBox(height: 20),
              SettingsSubtitle(
                subtitle: 'Billede',
                dialogTitle: 'Tilpasning af billede',
                dialogContent: VisualDialogContent(),
              ),
              VisualSettings(),
              SizedBox(height: 20),
              SettingsSubtitle(
                subtitle: 'Forløb',
                dialogTitle: 'Tilpasning af forløb',
                dialogContent: ProgrammeDialogContent(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextButton(
                  child: Text('Tilpas forløb'),
                  onPressed: () => Navigator.of(context).pushNamed(
                    'programme_edit',
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
        bottomBar: AKBottomAppBar(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('control'),
              child: Text('Start'),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    ),
                  ),
            ),
          ],
        ));
  }
}
