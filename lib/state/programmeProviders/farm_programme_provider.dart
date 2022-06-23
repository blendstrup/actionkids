import 'package:actionkids/state/settings_providers.dart';

import '/data/models/module_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmProgramme extends StateNotifier<List<Module>> {
  FarmProgramme([List<Module>? modules]) : super(modules ?? []);
}

final farmProvider = StateNotifierProvider<FarmProgramme, List<Module>>((ref) {
  List<int> loopCounts() {
    int kidsAmount = ref.read(kidsAmountProvider).state;
    bool isAutomatic = ref.read(isAutomaticProvider).state;

    // Initialized for the default kidsAmount = 10
    List<List<int>> loopCounts = [
      [1],
      [3, 7],
      [6, 3],
      [3, 7],
      [2, 8],
      [3, 6],
      [3, 7],
      [5, 4],
      [7, 3],
      [6, 3],
      [5, 4],
      [4, 4],
      [6, 3],
      [3, 6],
      [5, 4],
      [1],
      [3, 7],
      [2, 11],
      [5, 4],
      [3, 6],
      [1],
    ];

    if (!isAutomatic) return loopCounts.map((e) => 1).toList();

    for (var loop in loopCounts)
      for (int i = 1; i <= 99; i++) {
        if (loop.length > 1) {
          if (kidsAmount >= 10 + loop[1] * i) {
            loop[0]++;
          } else if (kidsAmount <= 10 - loop[1] * i) {
            loop[0]--;
          }
        }
      }

    return loopCounts.map((e) => e[0]).toList();
  }

  int getInitialIntroIndex(int moduleIndex) {
    List<int> moduleAudioCount = loopCounts().map((e) {
      if (e == loopCounts()[0] ||
          e == loopCounts()[15] ||
          e == loopCounts()[20])
        return e;
      else
        return e + 2;
    }).toList();

    int introIndex = 0;
    for (int i in moduleAudioCount.sublist(0, moduleIndex)) {
      introIndex += i;
    }

    return introIndex;
  }

  return FarmProgramme([
    Module(
      id: 0,
      title: 'Introsang',
      description: 'Introsang for Action Kids',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/1_intro.png',
      blurHash: 'L8HXHYt7VsoNL4WEbbbXvyfje.n+',
      loopCount: loopCounts()[0],
      introAudio: 'assets/audio/bondegaard/01_intro.mp3',
      introIndex: getInitialIntroIndex(0),
      single: true,
    ),
    Module(
      id: 1,
      title: 'Hanen galer',
      description:
          'Løb rundt og fang alle dyrene, og når hanen galer, så stå på tæer.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/2_hanengaler.png',
      blurHash: 'L-I%RAbbf6j[tWf6bHfkV:f6a}fj',
      loopCount: loopCounts()[1],
      introAudio: 'assets/audio/bondegaard/02_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/02_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/02_outro.mp3',
      introIndex: getInitialIntroIndex(1),
      single: false,
    ),
    Module(
      id: 2,
      title: 'Malk koen',
      description: 'Sid ned på hug og malk med hænderne op og ned.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/3_malkkoen.png',
      blurHash: 'L-I%UIjZjZfktWbHbGf7Rffja}fP',
      loopCount: loopCounts()[2],
      introAudio: 'assets/audio/bondegaard/03_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/03_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/03_outro.mp3',
      introIndex: getInitialIntroIndex(2),
      single: false,
    ),
    Module(
      id: 3,
      title: 'Saml æg',
      description:
          'Tøm redderne for æg ved at stå på tæer i strakt arm og sæt æggene ned i kurven på hug.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/4_samlæg.png',
      blurHash: 'LOLV:LoLofj[~Aayayj[9afQayay',
      loopCount: loopCounts()[3],
      introAudio: 'assets/audio/bondegaard/04_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/04_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/04_outro.mp3',
      introIndex: getInitialIntroIndex(3),
      single: false,
    ),
    Module(
      id: 4,
      title: 'Strigl hesten',
      description:
          'Børst hesten med store bevægelser først med den ene hånd og derefter den anden.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/5_striglhesten.png',
      blurHash: 'L+JT3bkCj[fkp3aya{fkRfayj@fQ',
      loopCount: loopCounts()[4],
      introAudio: 'assets/audio/bondegaard/05_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/05_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/05_outro.mp3',
      introIndex: getInitialIntroIndex(4),
      single: false,
    ),
    Module(
      id: 5,
      title: 'Hent katten',
      description:
          'Balancer på en bjælke ud til katten for at samle den op på hug og derefter balancer tilbage.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/6_hentkatten.png',
      blurHash: 'LCIQZVJ=S%waY8ROv|XT^HNIS*s,',
      loopCount: loopCounts()[5],
      introAudio: 'assets/audio/bondegaard/06_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/06_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/06_outro.mp3',
      introIndex: getInitialIntroIndex(5),
      single: false,
    ),
    Module(
      id: 6,
      title: 'Leg med hunden',
      description:
          'Kast pinden langt væk med hver hånd og derefter spark til bolden med hver fod.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/7_legmedhunden.png',
      blurHash: 'L:J0Zej[jZj[tWazj[jtaZayj[jt',
      loopCount: loopCounts()[6],
      introAudio: 'assets/audio/bondegaard/07_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/07_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/07_outro.mp3',
      introIndex: getInitialIntroIndex(6),
      single: false,
    ),
    Module(
      id: 7,
      title: 'Red killingerne',
      description: 'Hop højt med hænderne over hovedet.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/8_redkillingerne.png',
      blurHash: 'L,J0Zej?adbHxzj[flazjBj[j]ay',
      loopCount: loopCounts()[7],
      introAudio: 'assets/audio/bondegaard/08_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/08_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/08_outro.mp3',
      introIndex: getInitialIntroIndex(7),
      single: false,
    ),
    Module(
      id: 8,
      title: 'Træk tyren',
      description: 'Hiv i snoren alt hvad du kan.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/9_træktyren.png',
      blurHash: 'L9E33ekWOYnO00aenibb_NjYsSX8',
      loopCount: loopCounts()[8],
      introAudio: 'assets/audio/bondegaard/09_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/09_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/09_outro.mp3',
      introIndex: getInitialIntroIndex(8),
      single: false,
    ),
    Module(
      id: 9,
      title: 'Lav sjov med grisen',
      description: 'Rul rundt i grisestien og lav nogle sjove stillinger.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/10_lavsjovmedgrisen.png',
      blurHash: 'L9HWh4ofnTxHLmX4X5WBVurdjbXN',
      loopCount: loopCounts()[9],
      introAudio: 'assets/audio/bondegaard/10_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/10_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/10_outro.mp3',
      introIndex: getInitialIntroIndex(9),
      single: false,
    ),
    Module(
      id: 10,
      title: 'Fang museungerne',
      description: 'Kravl ind under hestevognen og fang museungerne.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/11_fangmus.png',
      blurHash: 'L;J0WWjsbbbItWfkjZf6W7a}j?js',
      loopCount: loopCounts()[10],
      introAudio: 'assets/audio/bondegaard/11_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/11_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/11_outro.mp3',
      introIndex: getInitialIntroIndex(10),
      single: false,
    ),
    Module(
      id: 11,
      title: 'Fang kaninerne',
      description: 'Sid på hug og lav kaninhop rundt omkring.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/12_fangkanin.png',
      blurHash: 'L-Is:qj[f6j[tWfQfkfQV:fQfkfP',
      loopCount: loopCounts()[11],
      introAudio: 'assets/audio/bondegaard/12_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/12_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/12_outro.mp3',
      introIndex: getInitialIntroIndex(11),
      single: false,
    ),
    Module(
      id: 12,
      title: 'Strøm i hegnet',
      description:
          'Kravl rundt på gulvet så fladt som muligt så du ikke får stød.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/13_strømihegn.png',
      blurHash: 'L:I%UHj[j?fRtWaza|j@Ryf6a}fP',
      loopCount: loopCounts()[12],
      introAudio: 'assets/audio/bondegaard/13_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/13_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/13_outro.mp3',
      introIndex: getInitialIntroIndex(12),
      single: false,
    ),
    Module(
      id: 13,
      title: 'Kokassen',
      description:
          'Hop rundt på marken og når kokassen kommer, så hop tre gange på det samme sted.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/14_kokassen.png',
      blurHash: 'L.Is:qa}jZj[tWj[fka}V:j@fkfQ',
      loopCount: loopCounts()[13],
      introAudio: 'assets/audio/bondegaard/14_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/14_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/14_outro.mp3',
      introIndex: getInitialIntroIndex(13),
      single: false,
    ),
    Module(
      id: 14,
      title: 'Drikkepause',
      description: 'Alle kan få lidt at drikke før vi fortsætter.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/15_drikkepause.png',
      blurHash: 'L.I%XQj[ayfktWfQa|a|W6fQa|ay',
      loopCount: loopCounts()[14],
      introAudio: 'assets/audio/bondegaard/15_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/15_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/15_outro.mp3',
      introIndex: getInitialIntroIndex(14),
      single: false,
    ),
    Module(
      id: 15,
      title: 'Mellempause',
      description: 'Pause med baggrundsmusik.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/16_mellemsang.png',
      blurHash: 'L7HNv.XmjDs:LNnhWDX8#6X8oeni',
      loopCount: loopCounts()[15],
      introAudio: 'assets/audio/bondegaard/16_intro.mp3',
      introIndex: getInitialIntroIndex(15),
      single: true,
    ),
    Module(
      id: 16,
      title: 'Stopdans',
      description:
          'Dans og tummel rundt på gulvet, men når musikken stopper, skal man stå stille.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/17_stopdans.png',
      blurHash: 'L.Is:pbHf6jttWjtfkbHW6jtj[fQ',
      loopCount: loopCounts()[16],
      introAudio: 'assets/audio/bondegaard/17_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/17_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/17_outro.mp3',
      introIndex: getInitialIntroIndex(16),
      single: false,
    ),
    Module(
      id: 17,
      title: 'Grisefest',
      description: 'Tænk på et dyr, og dans som du tror det dyr ville danse.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/18_grisefest.png',
      blurHash: 'L-J0Zfj@juj?tWa}j?a}W6a}j[bH',
      loopCount: loopCounts()[17],
      introAudio: 'assets/audio/bondegaard/18_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/18_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/18_outro.mp3',
      introIndex: getInitialIntroIndex(17),
      single: false,
    ),
    Module(
      id: 18,
      title: 'Drikkepause',
      description: 'Alle kan få lidt at drikke før vi fortsætter.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/19_drikkepause.png',
      blurHash: 'L.I%XQj[ayfktWfQa|a|W6fQa|ay',
      loopCount: loopCounts()[18],
      introAudio: 'assets/audio/bondegaard/19_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/19_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/19_outro.mp3',
      introIndex: getInitialIntroIndex(18),
      single: false,
    ),
    Module(
      id: 19,
      title: 'Sommerengen',
      description: 'Læg dig ned og slap af.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/20_sommerengen.png',
      blurHash: 'L.I?[[j[oLj[xza#j@a|aZa|j[ay',
      loopCount: loopCounts()[19],
      introAudio: 'assets/audio/bondegaard/20_intro.mp3',
      loopAudio: 'assets/audio/bondegaard/20_loop.mp3',
      outroAudio: 'assets/audio/bondegaard/20_outro.mp3',
      introIndex: getInitialIntroIndex(19),
      single: false,
    ),
    Module(
      id: 20,
      title: 'Forløb færdigt',
      description: 'Forløbet er færdigt og der spilles en afsluttende sang.',
      selected: true,
      backgroundPath: 'assets/images/bondegaard_images/21_outro.png',
      blurHash: 'L8HXHYt7rVs:L4WET1X8#6k9rqn\$',
      loopCount: loopCounts()[20],
      introAudio: 'assets/audio/bondegaard/21_intro.mp3',
      introIndex: getInitialIntroIndex(20),
      single: true,
    ),
  ]);
});
