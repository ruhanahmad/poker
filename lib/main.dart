import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/authentication.dart';
import 'package:poker/homepage.dart';
import 'package:poker/playerdetailpage.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PokerApp());}

class PokerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String gameName = '';
  int maxPlayers = 2; // Default to 2 players
  double buyInAmount = 0.0;
  List<String> playerNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poker Game'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Start Poker Game'),
            TextField(
              decoration: InputDecoration(labelText: 'Game Name'),
              onChanged: (value) {
                setState(() {
                  gameName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Max Players (1-10)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  maxPlayers = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Buy-In Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  buyInAmount = double.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen for player details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerDetailsPage(
                      gameName: gameName,
                      maxPlayers: maxPlayers,
                      buyInAmount: buyInAmount,
                    ),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

// Create the PlayerDetailsPage, GamePage, and other necessary widgets/screens.
