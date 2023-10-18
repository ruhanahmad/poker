

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poker/finalStack.dart';
import 'package:poker/history.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:poker/models/player_model.dart';
import 'package:poker/whoPay.dart';

import 'controllers/data_controller.dart';
// import 'package:share_plus/share_plus.dart';

class Shares extends StatelessWidget {
  List<Container> buyInsList = [];
  Uint8List? imageFilessss;


Shares({required this.imageFilessss});



  int n = 0;





  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    DataController _ = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: 
        Row(
          children: [
            const Text('Back', style: TextStyle(color: Colors.white)),
            const Spacer(),
            // TextButton.icon(
            //   onPressed: () {
            //   Get.to(()=>ContainerSelectionScreen())  ;
     
            //   },
            //   icon: const Icon(Icons.arrow_forward, color: Colors.white),
            //   label: const Text('Start'),
            // ),
          ],
        ),
        backgroundColor: const Color(0xFF505771),
        elevation: 0, // No shadow under the app bar
      ),
      backgroundColor: const Color(0xFF505771),
      //start k button se start time set kar lena hay
      ///end k button se endtime unka difference nikal lena hya
      ///
  
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:50.0),
              child: Container(
              
                decoration: BoxDecoration(
                    color: Color(0xFF7784B5),
                  borderRadius: BorderRadius.circular(45)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async{
                    

 
  //}
  //  else {
  //   // Instagram not installed, open Instagram in a web browser.
  //   final webUrl = 'https://www.instagram.com/';
  //   if (await canLaunch(webUrl)) {
  //     await launch(webUrl);
  //   } else {
  //     throw 'Could not launch Instagram';
  //   }
  // }
                      },
                      child: Text(_.gameNameController.text,
                          style: const TextStyle(  fontSize: 40.0,fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateTime.now().toString().split(' ')[0],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  )),
                              Row(
                                children: [
                                  const Text('Buy In: ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      )),
                                  // Replace '120' with the actual buy-in value from the previous screen
                                  Text(_.buyInController.text,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      color: const Color(0xFF626D94),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Row(
                          children: [
                            Text('Players', style: TextStyle(fontSize: 15,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.white,)),
                            Spacer(),
                            Text('Buy Ins',
                                style: TextStyle(fontSize: 15,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.white,)
                                ),
                            Spacer(),
                            Text('Buy Out ',
                                style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.white,)),
                      
                                  Spacer(),
                            Text('Net',
                                style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.white,)),
                          ],
                        ),
                      ),
                    ),
                    Image.memory(imageFilessss!),
                  // Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: Image.memory(capturedImage))),),
                    // Expanded(
                    //   child: Obx(
                    //     () => ListView.builder(
                    //       itemCount: _.playersList.length,
                    //       itemBuilder: ((context, index) {
                    //         return PlayerWidget(
                    //           index: index,
                    //         );
                    //       }),
                    //     ),
                    //   ),
                    // ),
                      
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(height: 98,width: 153,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/pokercalculator.png")))),
                         Column(children: [
                          Text("Powered by", style: TextStyle(fontSize: 12,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFC0BEBE),)),
                                    Text("Poker Calculator", style: TextStyle(fontSize: 20,fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.white,))
                         ],)
                       ],
                     ),
                 
                      
                  ],
                ),
              ),
            ),
            
              Container(
                color: Color(0xFF5E6995),
                height: 50 ,
                width: MediaQuery.of(context).size.width,

                child: Row(children: [
                   GestureDetector(
                    onTap: () async{



  try {
    // Get the application's temporary directory
    Directory tempDir = await getTemporaryDirectory();

    // Construct the file path for the image
    String filePath = '${tempDir.path}/"hello';

    // Create a File and write the image bytes to it
    File imageFile = File(filePath);
    await imageFile.writeAsBytes(imageFilessss!);

    // You can now access the image at `filePath` and copy it to the desired location if needed.
  } catch (e) {
    print('Error saving image: $e');
  }


  //                      final url = 'instagram://library?AssetPath=$imageFile';
  // //if (await launchUrl(Uri.parse(url))) {
  //   await launchUrl(Uri.parse('https://snapchat.com'));
                    },
                    child: Container(height: 98,width: 153,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/snap.jpg"))))),
                    GestureDetector(
                      onTap: ()async {
                         final url = 'instagram://library?AssetPath=$imageFilessss';
  //if (await launchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse('https://instagram.com'));
                      },
                      child: Container(height: 98,width: 153,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/insta.png")))))
                ],),

               ),
              
          ],
        ),
      ),
     
    );
  }
}

