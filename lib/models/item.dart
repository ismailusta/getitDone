class Item {
  final String title;
  bool isDone;

  Item({required this.title, this.isDone = false});
  void toggleItem() {
    isDone = !isDone;
  }

  Item.fromMap(Map map)
      : title = map["title"],
        isDone = map["isDone"];

  toMap() {
    return {"title": title, "isDone": isDone};
  }
}
