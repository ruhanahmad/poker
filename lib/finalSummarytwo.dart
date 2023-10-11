import 'package:flutter/material.dart';




class PokerCalculatorScreen extends StatefulWidget {
  @override
  State<PokerCalculatorScreen> createState() => _PokerCalculatorScreenState();
}

class _PokerCalculatorScreenState extends State<PokerCalculatorScreen> {
    bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // No app bar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for back button and title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Add your back button logic here
                },
              ),
              Row(
                children: [
                  Icon(Icons.abc_outlined),
                  Text("Poker Calculator"),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Final Summary",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w800,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          // Row for time and game time
          Row(
            children: [
              Text("Time: "),
              Text("Game Time"),
            ],
          ),
          // Container with four texts
          Container(
            width: double.infinity,
            height: 45,
            color: Color(0xFF626D94),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Players"),
                Text("Buyin\$"),
                Text("Buyout net"),
                Text(""), // Add your fourth text here
              ],
            ),
          ),

          GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Container(
                width: 412,
                height: isExpanded ? 183 : 60,
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
            ),

            // Expandable container

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
    );
  }
}
