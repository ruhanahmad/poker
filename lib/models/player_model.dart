// To parse this JSON data, do
//
//     final player = playerFromJson(jsonString);

import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());




class Player {
  String name;
  int buyIn;
  int amount;
   List<PlayerCashInOut> addresses = [];
   int finalAmount;
   String time;
   int lastAmount;

  Player({
    required this.name,
    required this.buyIn,
    required this.amount,
    required this.addresses,
    required this.finalAmount,
    required this.time,
    required this.lastAmount
    
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    name: json["name"],
    buyIn: json["buy_in"],
    amount: json["amount"],
    addresses: (json["addresses"] as List<dynamic>)
            .map((addrJson) => PlayerCashInOut.fromJson(addrJson))
            .toList(),
   finalAmount: json["finalAmount"]   ,
   time:json["time"] ,
   lastAmount: json["lastAmount"]   
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "buy_in": buyIn,
    "amount": amount,
      "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      "finalAmount":finalAmount,
      "time":time,
      "lastAmount":lastAmount
  };
}



PlayerCashInOut playerCashInOutFromJson(String str) => PlayerCashInOut.fromJson(json.decode(str));

String playerCashInOutToJson(PlayerCashInOut data) => json.encode(data.toJson());

class PlayerCashInOut {
  
    String time;
    double buyIn;
    int amount;
    

    PlayerCashInOut({
       
        required this.time,
        required this.buyIn,
        required this.amount,
      
    });

    factory PlayerCashInOut.fromJson(Map<String, dynamic> json) => PlayerCashInOut(
      
        time: json["time"],
        buyIn: json["buy_in"],
        amount: json["amount"],
    
    );

    Map<String, dynamic> toJson() => {
     
        "time": time,
        "buy_in": buyIn,
        "amount": amount,
      
    };
}
