import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/routes.dart' as appRoutes;
import 'pages/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTheme.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: appRoutes.Router.routes,
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
    );
  }
}

// Stuff to do:
// Tilføj duration til opgaverne på en eller anden måde? Måske bare for enkelte opgaver og ikke forløbet samlet?
// ++eller en til forløbet samlet i et hjørne, og en til den igangværende opgave under titel
// ++ Tilføj metode med inputs introDuration, loopDuration, outroDuration til Module, samt moduleDuration som skal udregnes ud fra tidligere samt loopCount
// ++ + Countdown ud fra totalDuration når et modul påbegyndes, reset til moduls duration når der trykkes tilbage eller næste
// Det skal være muligt bare at kunne trykke på "flyt" ikonet på kortene i tilpas forløb listen for at den begynder
// ++at svæve hvorefter man så kan trække i den og når der gives slip sætter den sig som normalt
// Container med fast bredden til knapper på control siden, og alignment til at placere dem mod ikon knappen i midten (virker ikke, mangler fast højde...)
// Hvis det første element i selected listen ikke er en single, så bugger systemet og alle efterfølgende afspilninger
// BottomBar is taller on control page compared to settings and programme edit pages


// 2. Iteration
// Titler på opgaver skal være centreret under et forløb (samt opgave tekster)
// Mindre tekst og mere visuelt (eks. ikoner til sværhedsgrad og udstyr)
// Mere whitespace (mindre margin, flyt settings titler og switches længere ud mod kanterne)
// ++skiftet fra 0.8 til 0.85 i base_page, samt 40 til 30 i settings widgets
// Skiftet ikoner i setting subtitles til help_outlined i stedet for info_outlined
// Skiftet ikonet på kort der kan trækkes i fra drag_handle til reorder
// Skiftet typography til OpenSans
// Skiftet alle outlinedButtons til textButtons
// Skiftet knapper i automatisk afspilning fra +/- 10s til næste/tilbage knapper men har beholdt vægtning (textButtons)
// Har gjort switches i indstillinger til adaptive så de skifter til platform specifikke switches
// Har skiftet input metoden til antal børn fra et tekstfelt til et nummer hjul
// Tilføj stor titel på forside i stedet for titel i appbar
// Flyttet tekst i menukort til øverste venstre hjørne
// Flyt start knap på settings side ned i en boks i bunden som altid er tilstede
// Flyt bekræft og fortryd knapperne på tilpas forløb siden ned i en boks i bunden som altid er tilstede
// Flyt rundt på bekræft og fortryd så bekræft ligger til højre
// Flyt kontrol knapperne under et forløb ned i en boks i bunden i stil med den fra start og bekræft/fortryd
// Juster spacing mellem indstillinger (gået fra 20 mellem afspilning og lyd til 10)
// Fikset lille fejl i afstanden mellem knapper under automatisk afspilning
// ++pause/start ikon knappen var ikke centreret grundet at tilbage er et længere ord end næste
// Fikset lille fejl hvor alert dialogen når et forløb afsluttes var hvid i dark mode på Android
// Tilføj sponsorer logoer på forsiden i bunden efter universerne
// Dialoger til alle indstillingskategorier
// Titler skal ikke have numre
// Vigtigt at det visuelle også kan være på kontrolsiden så kunderne ikke er afhængige af specifikt hardware (chromecast/Apple TV)
// Tilføj felt til at slå opgavetitel til/fra
// Det visuelle skal være tilstede under forløbet/kontrol siden (slide in/out menu i siden når skærmen er horisontal (hvid kasse ligesom bottombar))
// FadeIn billede med blurhash placeholder under forløb, da billederne er store og devices kan være gamle i børnehaverne
// Tilføj ikon til app
// Tilføj splashscreen til app (et til lyst tema, og et andet til mørkt tema)
// Næste/tilbage omkring mellemsang går galt, men kun der, og den løser sig selv tidligere og senere (fikset gennem oprydning af skrald kode)


// 3. Iteration
// Fixed Hvis man skifter afspilningstilstand så gendanner forløbs tilpasningen til standard
