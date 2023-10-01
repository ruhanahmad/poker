import 'package:flutter/material.dart';
import 'package:poker/gamepage.dart';

class PlayerDetailsPage extends StatefulWidget {
  final String gameName;
  final int maxPlayers;
  final double buyInAmount;

  PlayerDetailsPage({
    required this.gameName,
    required this.maxPlayers,
    required this.buyInAmount,
  });

  @override
  _PlayerDetailsPageState createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage> {
  List<String> playerNames = [];
  List<double> buyInAmounts = [];

   List<TextEditingController> oddTextControllers = [];
  List<TextEditingController> evenTextControllers = [];
  @override
  void dispose() {
    for (var controller in oddTextControllers) {
      controller.dispose();
    }
    for (var controller1 in evenTextControllers) {
      controller1.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('2. Player Details'),
              Text('Game Name: ${widget.gameName}'),
              Text('Max Players: ${widget.maxPlayers}'),
              Text('Buy-In Amount: \$${widget.buyInAmount.toStringAsFixed(2)}'),
              SizedBox(height: 16.0),
              Text('Enter Player Details:'),
              for (int i = 0; i < widget.maxPlayers; i++)
           
              //    oddTextControllers = List.generate(widget.maxPlayers.length, (_) => TextEditingController());
                         //     evenTextControllers = List.generate(documents.length, (_) => TextEditingController());
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Player ${i + 1} Name'),
                      onChanged: (value) {
                        setState(() {
                          playerNames[i] = value;

                          print(value);
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Buy-In for Player ${i + 1}'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          buyInAmounts[i] = double.parse(value);
                          print(value);
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  print(widget.maxPlayers);
                  print(buyInAmounts.length);
                  // Start the game with the provided player details
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GamePage(
                        gameName: widget.gameName,
                        maxPlayers: widget.maxPlayers,
                        buyInAmount: widget.buyInAmount,
                        playerNames: playerNames,
                        buyInAmounts: buyInAmounts,
                      ),
                    ),
                  );
                },
                child: Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
