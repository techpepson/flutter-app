void main() {
  Quote getQuote = Quote(
    text: "I love being great",
    author: "Dickson Daniel Peprah",
  );

  print("${getQuote.text} - ${getQuote.author}");
}

class Quote {
  String text;
  String author;

  Quote({required this.text, required this.author});
}

class TestAsyncCode {
  TestAsyncCode();

  void makeCall() {
    //simulate network calls
    Future.delayed(Duration(seconds: 5), () {});
  }
}
