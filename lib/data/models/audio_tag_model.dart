class AudioTag {
  AudioTag({
    required this.id,
    required this.type,
    this.loopCount = 1,
  });

  final int id;
  final String type;
  final int loopCount;
}
