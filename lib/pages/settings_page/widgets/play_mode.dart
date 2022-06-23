import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/pages/settings_page/widgets/switch_row.dart';
import '/state/settings_providers.dart';

class PlayMode extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    bool isIgnoring = watch(playmodeIgnorePointerProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchRow(
            title: 'Automatisk',
            provider: isAutomaticProvider,
          ),
          IgnorePointer(
            ignoring: isIgnoring,
            child: Opacity(
              opacity: isIgnoring ? 0.3 : 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Antal børn:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 40),
                  Consumer(builder: (context, watch, _) {
                    int value = watch(kidsAmountProvider).state;

                    return NumberPicker(
                      itemHeight: 25,
                      itemWidth: 60,
                      minValue: 1,
                      maxValue: 99,
                      haptics: true,
                      value: value,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.3)),
                      selectedTextStyle: Theme.of(context).textTheme.headline2,
                      onChanged: (i) =>
                          context.read(kidsAmountProvider).state = i,
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OldPlayModeSelect extends StatelessWidget {
  const OldPlayModeSelect({
    Key? key,
    required this.isAutomatic,
  }) : super(key: key);

  final bool isAutomatic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            child: Text('Automatisk'),
            style: TextButton.styleFrom(
              primary: isAutomatic
                  ? Theme.of(context).textTheme.bodyText1!.color
                  : Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.3),
              textStyle: Theme.of(context).textTheme.bodyText1,
              padding: EdgeInsets.all(0),
            ),
            onPressed: () {
              context.read(isAutomaticProvider).state ^= true;
              //context.read(playmodeIgnorePointerProvider).state ^= true;
            }),
        SizedBox(width: 40),
        TextButton(
            child: Text('Manuelt'),
            style: TextButton.styleFrom(
              primary: isAutomatic
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.3)
                  : Theme.of(context).textTheme.bodyText1!.color,
              textStyle: Theme.of(context).textTheme.bodyText1,
              padding: EdgeInsets.all(0),
            ),
            onPressed: () {
              context.read(isAutomaticProvider).state ^= true;
              //context.read(playmodeIgnorePointerProvider).state ^= true;
            }),
      ],
    );
  }
}
