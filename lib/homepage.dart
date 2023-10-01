import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/secondScreen.dart';

import 'controllers/data_controller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController _ = Get.put(DataController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('New Poker Game'),
          backgroundColor: const Color(0xFF505771),
        ),
        backgroundColor: const Color(0xFF505771),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit, size: 40.0),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      controller: _.gameNameController,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'New Game',
                        hintStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'Players',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      iconSize: 50,
                      color: Colors.green,
                      onPressed: () {
                        _.maxPlayers++;
                      },
                    ),
                    const SizedBox(width: 10.0),
                    Obx(() => Text(
                          '${_.maxPlayers}', // The initial value
                          style: const TextStyle(
                              fontSize: 56.0, color: Colors.white),
                        )),
                    const SizedBox(width: 10.0),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      iconSize: 50,
                      color: Colors.red,
                      onPressed: () {
                        if (_.maxPlayers.value == 0) {
                          return;
                        } else {
                          _.maxPlayers--;
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'Buy In',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _.buyInController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement logic to edit the number
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFF0A637),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => SecondScreen());
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF0A637),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
