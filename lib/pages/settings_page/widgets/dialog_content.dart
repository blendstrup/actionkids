import 'package:flutter/material.dart';
import '/pages/theme.dart';

class PlayDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RichText(
        text: TextSpan(
          text:
              'I denne tilpasningsmenu kan du vælge at starte forløbet automatisk eller manuelt.\n\nVed et ',
          style: Theme.of(context).textTheme.bodyText1,
          children: <TextSpan>[
            TextSpan(
              text: 'manuelt',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: AppTheme.smallFontSize,
                  ),
            ),
            TextSpan(
                text:
                    ' forløb, skal du selv trykke på “Næste” knappen, for at komme videre til den næste opgave. Hvis der ikke bliver trykket næste i det manuelle forløb, vil hver opgave blive ved med at fortsætte til at du trykker “Næste”.\n\nVed et '),
            TextSpan(
              text: 'automatisk',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: AppTheme.smallFontSize,
                  ),
            ),
            TextSpan(
                text:
                    ' forløb skifter opgaverne automatisk når den pågældende opgave er færdig. Ved et automatisk forløb skal du vælge antallet af børn der deltager, hvilket bruges til at justere opgavernes længde.'),
          ],
        ),
      ),
    );
  }
}

class SoundDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
            'I denne tilpasningmenu kan du slå musik og stemme til eller fra.\n\n',
        style: Theme.of(context).textTheme.bodyText1,
        children: <TextSpan>[
          TextSpan(
            text: 'Musik',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' i et forløb er alle de baggrundslyde, effekter og musik, som afspilles i et forløb.\n\n'),
          TextSpan(
            text: 'Stemme',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' i et forløb er instruktøren, som forklarer opgaverne undervejs i forløbet.'),
        ],
      ),
    );
  }
}

class VisualDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
            'I denne tilpasningsmenu kan du slå baggrund, opgavetekst og instruktør til eller fra.\n\n',
        style: Theme.of(context).textTheme.bodyText1,
        children: <TextSpan>[
          TextSpan(
            text: 'Baggrund',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' omfatter de illustrationer, som vises ved hver opgave i et forløb.\n\n'),
          TextSpan(
            text: 'Opgavetitel',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' er de titler som hver opgave har, og som vises ovenpå baggrunden.\n\n'),
          TextSpan(
            text: 'Opgavetekst',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' er en forklarende tekst af selve opgaven og øvelsen som vises ovenpå baggrunden.\n\n'),
          TextSpan(
            text: 'Instruktør',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' refererer til en animeret figur, der fremviser de øvelser, som børnene skal udføre for hver opgave.'),
        ],
      ),
    );
  }
}

class ProgrammeDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
            'I denne tilpasningsmenu kan du fjerne, tilføje og omrokere modulerne i et forløb.\n\nFor at ',
        style: Theme.of(context).textTheme.bodyText1,
        children: <TextSpan>[
          TextSpan(
            text: 'fjerne',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' en opgave, kan du trykke på fluebenet ved siden af opgavetitlen, hvorefter fluebenet skifter til et kryds og modulet vil blive gjort mindre synlig. For at '),
          TextSpan(
            text: 'tilføje',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' en opgave igen, kan du trykke på krydset og modulet vil derefter blive synlig igen.\n\nFor at '),
          TextSpan(
            text: 'omrokere',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: AppTheme.smallFontSize,
                ),
          ),
          TextSpan(
              text:
                  ' modulerne kan du holde inde på en opgave og derefter trække den hen til den ønskede placering.'),
        ],
      ),
    );
  }
}
