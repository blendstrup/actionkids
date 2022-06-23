import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchRow extends StatelessWidget {
  SwitchRow({
    required this.title,
    required this.provider,
  });

  final String title;
  final StateProvider<bool> provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Consumer(
          builder: (context, watch, _) {
            bool isOn = watch(provider).state;

            return Switch.adaptive(
              value: isOn,
              onChanged: (val) => context.read(provider).state ^= true,
              activeColor: Theme.of(context).primaryColor,
            );
          },
        ),
      ],
    );
  }
}
