import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PokerCalculatorScreen(),
      ),
    );
  }
}

class PokerCalculatorScreen extends StatefulWidget {
  @override
  _PokerCalculatorScreenState createState() => _PokerCalculatorScreenState();
}

class _PokerCalculatorScreenState extends State<PokerCalculatorScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // No app bar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your existing widgets go here...

            // Wrap the main and expandable containers in a parent container
            Container(
              width: 412,
              height: isExpanded ? 243 : 60,
              decoration: BoxDecoration(
                color: Color(0xFF99A0BA),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Name"),
                      Text("Amount"),
                      Text("Buyin"),
                      Text("Net"),
                    ],
                  ),
                  // Expandable container
                  if (isExpanded)
                    Container(
                      height: 111,
                      width: 396,
                      color: Color(0xFF626D94),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Text 1"),
                          Text("Text 2"),
                          Text("Text 3"),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Row with two containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 170,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF99A0BA),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 170,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF99A0BA),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Share",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Container with height 67
            Container(
              width: 281,
              height: 67,
              decoration: BoxDecoration(
                color: Color(0xFFF0A637),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Your Text Here",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
