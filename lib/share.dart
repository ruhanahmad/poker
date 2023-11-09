
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poker/finalStack.dart';
import 'package:poker/history.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:poker/models/player_model.dart';
import 'package:poker/whoPay.dart';

import 'controllers/data_controller.dart';
// import 'package:share_plus/share_plus.dart';

class Shares extends StatefulWidget {
  Uint8List? imageFilessss;


Shares({required this.imageFilessss});

  @override
  State<Shares> createState() => _SharesState();
}

class _SharesState extends State<Shares> {
  List<Container> buyInsList = [];

  int n = 0;

  ScreenshotController screenshotController = ScreenshotController();

  Uint8List? _imageFile;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    DataController _ = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/back.png"))),)),

                              GestureDetector(
                onTap: () {
                  // Get.back();
                },
                child: Row(
                  children: [
                    Container(height: 24,width: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/casino.png"))),),
                    Text("Poker Calculator",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w800,color: Colors.white),)
                  ],
                )),
            ],),
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
            Screenshot(
                  controller: screenshotController,
              child: Padding(
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
                      // Image.memory(imageFilessss!),
                  //  Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: Image.memory(capturedImage))),),
                      Container(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => ListView.builder(
                            itemCount: _.playersList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return PlayerWidget(
                                index: index,
                              );
                            }),
                          ),
                        ),
                      ),
                        
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
            ),
            SizedBox(height: 10,),
           // Container with height 67
            GestureDetector(
             
 
                                         onTap: () async{
await screenshotController
                    .capture()
                    .then((capturedImage) async {

                       // ShowCapturedWidget(context,  capturedImage!);
                setState(() {
                   _imageFile = capturedImage; 
                });
                 

                }).catchError((onError) {
                  print(onError);
                });
          
                print(_imageFile); 
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/temp_image.png');

  // Write the Uint8List to the temporary file
  await file.writeAsBytes(_imageFile!);

  try {
    final result = await ImageGallerySaver.saveFile(file.path);
    if (result != null && result.isNotEmpty) {
      Get.snackbar("Success","Image saved to Gallery");
      print('Image saved to gallery: $result');
    } else {
      print('Failed to save image to gallery.');
    }
  } on PlatformException catch (e) {
    print('Error saving image to gallery: $e');
  }




              
            },
              child: Container(
                width: 281,
                height: 67,
                decoration: BoxDecoration(
                  color: Color(0xFFF0A637),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Text(
                    "Download",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

 
//               Container(
//                 color: Color(0xFF5E6995),
//                 height: 50 ,
//                 width: MediaQuery.of(context).size.width,

//                 child: Row(children: [
//                    GestureDetector(
//                     onTap: () async{
// await screenshotController
//                     .capture()
//                     .then((capturedImage) async {

//                        // ShowCapturedWidget(context,  capturedImage!);
//                 setState(() {
//                    _imageFile = capturedImage; 
//                 });
                 

//                 }).catchError((onError) {
//                   print(onError);
//                 });
          
//                 print(_imageFile); 
//   final tempDir = await getTemporaryDirectory();
//   final file = File('${tempDir.path}/temp_image.png');

//   // Write the Uint8List to the temporary file
//   await file.writeAsBytes(_imageFile!);

//   try {
//     final result = await ImageGallerySaver.saveFile(file.path);
//     if (result != null && result.isNotEmpty) {
//       print('Image saved to gallery: $result');
//     } else {
//       print('Failed to save image to gallery.');
//     }
//   } on PlatformException catch (e) {
//     print('Error saving image to gallery: $e');
//   }



//   //                      final url = 'instagram://library?AssetPath=$imageFile';
//   // //if (await launchUrl(Uri.parse(url))) {
//   //   await launchUrl(Uri.parse('https://snapchat.com'));
//                     },
//                     child: Container(height: 98,width: 153,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/snap.jpg"))))),
//                     GestureDetector(
//                       onTap: ()async {
//                          final url = 'instagram://library?AssetPath=${widget.imageFilessss}';
//   //if (await launchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse('https://instagram.com'));
//                       },
//                       child: Container(height: 98,width: 153,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/insta.png")))))
//                 ],),

//                ),
              
          ],
        ),
      ),
     
    );
  }
}


class PlayerWidget extends StatefulWidget {
  final index;

  const PlayerWidget({super.key, required this.index});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool isEditing = true;
  bool savedIcon = true;
  bool isDelete = false;
  bool isExpanded = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final DataController _ = Get.find();
 DateTime now = DateTime.now();


//
  bool isGreen = false;
  @override
  void initState() {
    if (_.playersList[widget.index].amount != 0) {
      isEditing = false;
      savedIcon = false;
    }
    super.initState();
  }

  int showvalue = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    {
      final data = _.playersList[widget.index];

      return 
      AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: isExpanded?size.width*.6: size.width * .1,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: const Color(0xff99A0BA),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: 
        Column(
          children: [
            SizedBox(height: size.width*.025,),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        data.amount.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        data.finalAmount.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                        GestureDetector(
                          onTap: (){
                             
                          // isExpanded=!isExpanded;
                          // setState(() {
                            
                          // });
                
                          },
                          child: Text(
                          data.lastAmount.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                                              ),
                        ),
                    ],
                  ),
                ),
                //  Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.cyclone_outlined,color: Color(0xff97EEA5),),
                //       InkWell(
                //         onTap: (){
                //           isExpanded=!isExpanded;
                //           setState(() {
                            
                //           });
                //         },
                //         child: Icon(isExpanded?Icons.keyboard_arrow_up: Icons.keyboard_arrow_down,color: Color(0xff97EEA5),),),
            
                //     ],
                //   ),
                // ),
              ],
            ),
        if(isExpanded)
        Builder(
          builder: (context) {
List<Player> mainRecords = [];
  final data = _.playersList[widget.index];

  // final dataTwo = _.playerCashInOut[widget.index];
      nameController.text = data.name;
      amountController.text = data.amount.toString();
            return Column(children: [
             // SizedBox(height: size.width*.0125,),
              // Divider(
              //   thickness: 1,
              //   color: Color(0xffB4B4B4),),
            
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: AnimatedContainer(
                             duration: const Duration(microseconds: 250),
                             margin: const EdgeInsets.symmetric(vertical: 5.0),
                             padding: const EdgeInsets.all(15.0),
                             decoration: BoxDecoration(
                               color: const Color(0xFF626D94),
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                            //  height: 200,
                             width: MediaQuery.of(context).size.width,
                             child: 
                             Column(
                               children: [
                             
                             
                                 Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("Session Log",style: TextStyle(color: Color(0xffB4B4B4,),fontSize: 13),),
                      
                                 
                    ],),
                                 ),
                                 SizedBox(height: 10,),
                               
                             Container(
                               height: 120,
                               width: MediaQuery.of(context).size.width,
                               child: ListView.builder(
                                 itemCount: data.addresses.length,
                                 scrollDirection: Axis.vertical,
                                 itemBuilder:(context,i){
                             return                    Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            
                              width: 397,
                            //  padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF626D94)),
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0XFF626D94)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                           Text('${data.addresses[i].time}',style: TextStyle(color: Colors.white, ),),
                                        Text(' Cash in ${data.addresses[i].buyIn} Buy In  ${data.addresses[i].amount}',style: TextStyle(color: Colors.white),),
                                        // Text('}'),
                                        
                                      ],
                                    ),
                                    // Text("${data.lastAmount}")
                                  ],
                                ),
                              ),
                            ),
                          );
                             
                                 }),
                             )
                              
                             
                               ],
                             ),
                                 ),
                 )
            ],);
          }
        ),
        
        
          ],
        ),
      );
    }
  }
}

