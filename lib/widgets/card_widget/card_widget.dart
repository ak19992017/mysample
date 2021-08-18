import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card widget"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildQuoteCard(),
            buildRoundedCard(),
            buildColouredcard(),
            buildImageCard(),
            buildImageInteractionCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        onPressed: () {},
      ),
    );
  }

  Widget buildQuoteCard() => Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'If you can\'t win today ,you cannot win tomorrow\nYou have to win today to win tomorrow',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
              Text(
                "Sam",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );

  Widget buildRoundedCard() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rounded card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "This card is rounded ",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      );

  Widget buildColouredcard() => Card(
        shadowColor: Colors.red,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Coloured card',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "This card is rounded and has a gradient ",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildImageCard() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1027&q=80'),
              height: 240,
              fit: BoxFit.cover,
              child: InkWell(onTap: () {}),
            ),
            Text(
              "Card with splash",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );

  Widget buildImageInteractionCard() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1027&q=80'),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  left: 16,
                  child: Text(
                    "Cats rule the world",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                "The cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(onPressed: () {}, child: Text("Buy Cat")),
                TextButton(onPressed: () {}, child: Text("Buy Cat Food"))
              ],
            ),
          ],
        ),
      );
}
