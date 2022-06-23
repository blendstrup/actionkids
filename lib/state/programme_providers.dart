import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/models/module_model.dart';
import '/state/programmeProviders/farm_programme_provider.dart';

class Programme extends StateNotifier<List<Module>> {
  Programme([List<Module>? modules]) : super(modules ?? []);

  void toggle(int id) {
    state = [
      for (final module in state)
        if (module.id == id)
          Module(
            id: module.id,
            selected: !module.selected,
            description: module.description,
            title: module.title,
            loopCount: module.loopCount,
            introIndex: module.introIndex,
            backgroundPath: module.backgroundPath,
            blurHash: module.blurHash,
            single: module.single,
          )
        else
          module,
    ];
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Module item = state.removeAt(oldIndex);
    state.insert(newIndex, item);
    state = state;
  }
}

final programmeProvider = StateNotifierProvider<Programme, List<Module>>((ref) {
  List<Module> programme = ref.watch(farmProvider);
  return Programme([...programme]);
});

final selectedModulesProvider = Provider<List<Module>>((ref) {
  final modules = ref.watch(programmeProvider);
  return modules.where((module) => module.selected).toList();
});

final selectedModulesProvider2 = Provider<List<Module>>((ref) {
  final modules = ref.watch(programmeProvider);
  final selected = modules.where((module) => module.selected).toList();

  List<int> moduleAudioCount = selected.map((e) {
    if (e.single == true)
      return e.loopCount;
    else
      return e.loopCount + 2;
  }).toList();

  // TODO If the first item in the selected list is not a single, the next button stops working and all attempts to play afterwards are bugged
  // bugged == the programme starts at the previously first module (that wasnt a single)
  // and cannot go back (even though a single has been added and the back button correctly shows) or to the next
  int updateIntroIndex(int moduleIndex) {
    int introIndex = 0;
    for (int i in moduleAudioCount.sublist(0, moduleIndex)) introIndex += i;
    return introIndex;
  }

  return selected
      .asMap()
      .map((i, module) =>
          MapEntry(i, module.copyWith(introIndex: updateIntroIndex(i))))
      .values
      .toList();
});
