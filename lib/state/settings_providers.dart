import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAutomaticProvider = StateProvider((ref) => true);

// ignore: missing_return
final playmodeIgnorePointerProvider = Provider<bool>((ref) {
  final isAutomatic = ref.watch(isAutomaticProvider);

  switch (isAutomatic.state) {
    case true:
      return false;
    case false:
      return true;
    default:
      return false;
  }
});

final isMusicOnProvider = StateProvider((ref) => true);
final isVoiceOnProvider = StateProvider((ref) => true);

final isBackgroundOnProvider = StateProvider((ref) => true);
final isModuleTextOnProvider = StateProvider((ref) => true);
final isModuleTitleOnProvider = StateProvider((ref) => true);
final isInstructorOnProvider = StateProvider((ref) => true);

final kidsAmountProvider = StateProvider((ref) => 10);
