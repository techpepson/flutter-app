import 'quote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class WeatherAppHome extends StatefulWidget {
  const WeatherAppHome({super.key});

  @override
  State<WeatherAppHome> createState() => _WeatherAppHomeState();
}

class _WeatherAppHomeState extends State<WeatherAppHome> {
  int stage = 0;
  final myController = TextEditingController();
  final _myFormKey = GlobalKey<FormState>();
  final bool isVisible = false;
  final snackBar = SnackBar(
    content: Text("Kudos bro"),
    action: SnackBarAction(label: "Undo", onPressed: () => "Undone"),
  );
  Map data = {};

  //create a list of items
  List<Quote> quotes = [
    Quote(
        text: "I will be a wealthy CEO before age 26",
        author: "Dickson Daniel Peprah"),
    Quote(
        text: "I will push through until my dreams come through",
        author: "Doris Appiah"),
    Quote(
        text: "It is no more about anyone, it is about us",
        author: "Festus Nti Berko")
  ];

  //create card template
  //delete widget
  void deleteQuote(Quote quote) {
    setState(() {
      quotes.remove(quote);
    });
  }

  void updateStage() {
    setState(() {
      stage++;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Net Ninja Weather App"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('$stage'),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Container(
                    color: Colors.cyanAccent,
                    padding: EdgeInsets.all(10.5),
                    margin: EdgeInsets.all(8.0),
                    child: Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("Press me in the column")),
                            Text(
                              "I am above the lower text",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontFamily: "Bold")),
                            ),
                            Text("I am below the upper text"),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: [Image(image: AssetImage('name'))],
                                )),
                            Stack(
                              children: [Positioned(child: Text("I am cool"))],
                            ),
                            SizedBox(),
                            ListView(),
                            Scrollbar(child: Text("")),
                            CustomScrollView(
                              slivers: [
                                SliverAppBar(),
                              ],
                            )
                          ],
                        ))),
                RichText(
                  text: TextSpan(
                    text: "Hola Madridistas!! ",
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Ensures proper contrast
                        ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: "Bold",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add spacing

                const SelectableText(
                  "Welcome to the Weather App!",
                  style: TextStyle(
                    fontSize: 18,
                    backgroundColor: Color(0xFFFF9000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Tektur",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mascot Name",
                    ),
                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/house.avif', fit: BoxFit.cover),
                ),

                const SizedBox(height: 10), // Add spacing

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20.5),
                  ),
                  onPressed: () {
                    print("I am an outlined button");
                  },
                  child: const Text("I am an outlined button"),
                ),

                GestureDetector(
                  onTap: () => print("I have been tapped"),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Tap me!",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ),
                Column(
                  children: quotes.map((quote) {
                    return QuoteCard(
                      quote: quote,
                      delete: () => deleteQuote(quote),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/',
                          arguments: {"name": "john"});
                    },
                    child: Icon(Icons.edit_location,
                        semanticLabel: 'Go to input area')),
                GestureDetector(
                  child: Text("I am me"),
                ),
                Dismissible(
                  key: Key(""),
                  direction: DismissDirection.endToStart,
                  child: Column(),
                  onDismissed: (direction) => print("I have it"),
                ),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(icon: Icon(Icons.abc_rounded)),
                ),
                Form(
                  key: _myFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: myController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("The value should not be empty");
                          }
                          if (_myFormKey.currentState!.validate()) {}
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => updateStage(),
        backgroundColor: Colors.orange[500],
        child: Icon(Icons.add),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key, required this.quote, required this.delete});

  final dynamic quote;

  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.5,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
            ),
            SizedBox(height: 15.0),
            Text(quote.author),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: delete,
              label: Text("Delete quote"),
            )
          ],
        ),
      ),
    );
  }
}
