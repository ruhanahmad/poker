import 'package:flutter/material.dart';

class EndGameSummaryPage extends StatelessWidget {
  final String gameName;
  final List<String> playerNames;
  final List<double> playerStacks;

  EndGameSummaryPage({
    required this.gameName,
    required this.playerNames,
    required this.playerStacks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Game Summary: $gameName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('4. End Game Summary'),
            Text('Game Name: $gameName'),
            SizedBox(height: 16.0),
            Text('Player Summary:'),
            for (int i = 0; i < playerNames.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Player ${i + 1}: ${playerNames[i]}'),
                  Text('Buy-In: \$${playerStacks[i].toStringAsFixed(2)}'),
                  Text('Final Stack: \$${playerStacks[i].toStringAsFixed(2)}'),
                  Text('Profit/Loss: \$${(playerStacks[i] - playerStacks[0]).toStringAsFixed(2)}'),
                  SizedBox(height: 8.0),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home page or perform other actions
                Navigator.pop(context);
              },
              child: Text('Return to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
