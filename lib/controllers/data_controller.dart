import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../models/player_model.dart';

class DataController extends GetxController
{
  var maxPlayers = 0.obs;
  TextEditingController buyInController = TextEditingController();
  TextEditingController gameNameController = TextEditingController();
  late DateTime startTime,endTime;
  var playersList = <Player>[].obs;
   var playersListq = <PlayerCashInOut>[].obs;
   DocumentReference? ref;
   

  var nn;

  // var playerCashInOut = <PlayerCashInOut>[].obs;

  int showvalue = 0;



}