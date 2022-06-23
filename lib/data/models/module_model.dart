class Module {
  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.selected,
    required this.loopCount,
    required this.introIndex,
    required this.backgroundPath,
    required this.blurHash,
    required this.single,
    this.duration = const Duration(seconds: 0),
    this.introAudio = '',
    this.loopAudio = '',
    this.outroAudio = '',
  });

  final int id;
  final String title;
  final String description;
  final String introAudio;
  final String loopAudio;
  final String outroAudio;
  final String backgroundPath;
  final String blurHash;
  final bool single;
  Duration duration;
  int loopCount;
  int introIndex;
  bool selected;

  Module copyWith({
    int? id,
    String? title,
    String? description,
    String? introAudio,
    String? loopAudio,
    String? outroAudio,
    String? backgroundPath,
    String? blurHash,
    bool? single,
    Duration? duration,
    int? loopCount,
    int? introIndex,
    bool? selected,
  }) {
    return Module(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      selected: selected ?? this.selected,
      loopCount: loopCount ?? this.loopCount,
      introIndex: introIndex ?? this.introIndex,
      backgroundPath: backgroundPath ?? this.backgroundPath,
      blurHash: blurHash ?? this.blurHash,
      single: single ?? this.single,
      duration: duration ?? this.duration,
      introAudio: introAudio ?? this.introAudio,
      loopAudio: loopAudio ?? this.loopAudio,
      outroAudio: outroAudio ?? this.outroAudio,
    );
  }

  @override
  String toString() {
    return 'Module(title: $title, selected: $selected)';
  }
}
