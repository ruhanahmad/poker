import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/secondScreen.dart';

import 'controllers/data_controller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController _ = Get.put(DataController());
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //  elevation: 0,
          // automaticallyImplyLeading: false,
          // backgroundColor: Color(0xFF505771),
          // ),
          backgroundColor: const Color(0xFF505771),
          body: Container(
            height:900,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: 
                      Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/back.png"))),)),
                              
                                    GestureDetector(
                      onTap: () {
                        // Get.back();
                      },
                      child: Row(
                        children: [
                          Container(height: 24,width: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/casino.png"))),),
                          Text("Poken Calculator",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w800,color: Colors.white),)
                        ],
                      )),
                                    ],),
                    ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                  child: Container(
                    height: MediaQuery.of(context).size.height -50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:60.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Icon(Icons.edit, size: 40.0,color: Colors.white,),
                                  Container(height: 34,width: 34,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/design.png"),fit: BoxFit.cover)),),
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
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily:'Open Sans'
                                      ),
                                      
                                     border: InputBorder.none, // Remove the border
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Customize the underline when focused
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey), // Customize the underline when enabled
                ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                                SizedBox(height: 60,),
                            // const Text(
                            //   'Players',
                            //   style: TextStyle(fontSize: 24.0, color: Colors.white),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       IconButton(
                            //         icon: const Icon(Icons.add),
                            //         iconSize: 50,
                            //         color: Colors.green,
                            //         onPressed: () {
                            //           _.maxPlayers++;
                            //         },
                            //       ),
                            //       const SizedBox(width: 10.0),
                            //       Obx(() => Text(
                            //             '${_.maxPlayers}', // The initial value
                            //             style: const TextStyle(
                            //                 fontSize: 56.0, color: Colors.white),
                            //           )),
                            //       const SizedBox(width: 10.0),
                            //       IconButton(
                            //         icon: const Icon(Icons.remove),
                            //         iconSize: 50,
                            //         color: Colors.red,
                            //         onPressed: () {
                            //           if (_.maxPlayers.value == 0) {
                            //             return;
                            //           } else {
                            //             _.maxPlayers--;
                            //           }
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const Spacer(),
                            const Text(
                              'Buy In',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 20,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _.buyInController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 60.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      decoration: const InputDecoration(
                                         hintText: '500',
                                      hintStyle: TextStyle(
                                        fontSize: 60.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily:'Open Sans'
                                      ),
                                            border: InputBorder.none, // Remove the border
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Customize the underline when focused
                ),
                             ),
                                      
                                    ),
                                  ),
                                   SizedBox(width: 10,),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     // Implement logic to edit the number
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     primary: const Color(0xFFF0A637),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(20.0),
                                  //     ),
                                  //   ),
                                  //   child: const Text(
                                  //     'Edit',
                                  //     style: TextStyle(fontSize: 20.0),
                                  //   ),
                                  // ),

                                   Container(height: 34,width: 34,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/design.png"),fit: BoxFit.cover)),),
                                ],
                              ),
                            ),
                        SizedBox(height: 270,),

                        // Spacer(),
                            Container(
                              height:67 ,
                              width: 281,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(_.buyInController.text.isEmpty){
                                                      Get.snackbar("Error", "Kindly write the buy in");
                                  }
                                                     else{
                                                       Get.to(() => SecondScreen());
                                                     }           
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
