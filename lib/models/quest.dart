class Quest {
  String title;
  int xpReward;
  bool completed;

  Quest({
    required this.title,
    required this.xpReward,
    this.completed = false,
  });
}