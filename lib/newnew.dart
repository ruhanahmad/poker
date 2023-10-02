import 'package:get/get.dart';
import 'package:poker/controllers/data_controller.dart';

import 'main.dart';
import 'package:flutter/material.dart';


class mimor extends StatefulWidget {
  const mimor({super.key});

  @override
  State<mimor> createState() => _mimorState();
}

class _mimorState extends State<mimor> {
  @override
  Widget build(BuildContext context) {
    DataController _ = Get.put(DataController());
    return
    Scaffold(
      body:
           Container(
            height: 300,width: 400,child: ListView.builder(itemCount:3,itemBuilder: (context,i){
      Text("${_.playersList[i].finalAmount}");
    }),) 
    );
    

  }
}