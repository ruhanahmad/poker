import 'package:flutter/material.dart';
import 'package:poker/endsummarygame.dart';

class GamePage extends StatefulWidget {
  final String gameName;
  final int maxPlayers;
  final double buyInAmount;
  final List<String> playerNames;
  final List<double> buyInAmounts;

  GamePage({
    required this.gameName,
    required this.maxPlayers,
    required this.buyInAmount,
    required this.playerNames,
    required this.buyInAmounts,
  });

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<double> playerStacks; // Define playerStacks here

@override
void initState() {
  super.initState();

  // Ensure that buy-in amounts have been provided for each player
  assert(widget.buyInAmounts.length == widget.maxPlayers);

  // Initialize player stacks with buy-in amounts
  playerStacks = List.generate(widget.maxPlayers, (index) => widget.buyInAmounts[index]);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poker Game: ${widget.gameName}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('3. Game Details'),
            Text('Max Players: ${widget.maxPlayers}'),
            Text('Buy-In Amount: \$${widget.buyInAmount.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            Text('Player Details:'),
            for (int i = 0; i < widget.maxPlayers; i++)
              Column(
                children: [
                  Text('Player ${i + 1}: ${widget.playerNames[i]}'),
                  Text('Stack: \$${playerStacks[i].toStringAsFixed(2)}'),
                  SizedBox(height: 8.0),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                // Perform game actions (e.g., deal cards, manage bets)
                // Update player stacks and game state accordingly
                // You can implement the game logic here.
              },
              child: Text('Deal/Next Hand'),
            ),
            ElevatedButton(
              onPressed: () {
                // End the game and navigate to the end game summary page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndGameSummaryPage(
                      gameName: widget.gameName,
                      playerNames: widget.playerNames,
                      playerStacks: playerStacks,
                    ),
                  ),
                );
              },
              child: Text('End Game'),
            ),
          ],
        ),
      ),
    );
  }
}
