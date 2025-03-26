void main() {
  SetMap getMap = SetMap();

  print(getMap.student["name"]);
}

class Quote {
  String text;
  String author;

  Quote({required this.text, required this.author});
}

class SetMap {
  Map student = {"name": "Dickson Daniel Peprah", "age": 20};
}
