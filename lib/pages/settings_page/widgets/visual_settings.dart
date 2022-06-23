import 'package:flutter/material.dart';
import 'switch_row.dart';
import '/state/settings_providers.dart';

class VisualSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchRow(
            title: 'Baggrund',
            provider: isBackgroundOnProvider,
          ),
          SwitchRow(
            title: 'Opgavetitel',
            provider: isModuleTitleOnProvider,
          ),
          SwitchRow(
            title: 'Opgavetekst',
            provider: isModuleTextOnProvider,
          ),
          SwitchRow(
            title: 'Instruktør',
            provider: isInstructorOnProvider,
          ),
        ],
      ),
    );
  }
}
