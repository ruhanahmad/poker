

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/finalStack.dart';
import 'package:poker/history.dart';

import 'package:poker/models/player_model.dart';
import 'package:poker/test2.dart';
import 'package:poker/whoPay.dart';
import 'package:screenshot/screenshot.dart';

import 'controllers/data_controller.dart';

class FinalSummary extends StatefulWidget {
  @override
  State<FinalSummary> createState() => _FinalSummaryState();
}

class _FinalSummaryState extends State<FinalSummary> {
  List<Container> buyInsList = [];

  int n = 0;

  ScreenshotController screenshotController = ScreenshotController();

  Uint8List? _imageFile;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }
    DataController _ = Get.find();
    return Scaffold(
      appBar: AppBar(
        // title: 
        // Row(
        //   children: [
        //     const Text('Back', style: TextStyle(color: Colors.white)),
        //     const Spacer(),
        //     TextButton.icon(
        //       onPressed: () {
        //       Get.to(()=>ContainerSelectionScreen())  ;
     
        //       },
        //       icon: const Icon(Icons.arrow_forward, color: Colors.white),
        //       label: const Text('Start'),
        //     ),
        //   ],
        // ),
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
            Text("Final Summary",
                style: const TextStyle(  fontSize: 40.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
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
                        color: Colors.white,)),
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
            Expanded(
              child: Obx(
                () => Screenshot(
                  controller: screenshotController,
                  child: ListView.builder(
                    itemCount: _.playersList.length,
                    itemBuilder: ((context, index) {
                      return PlayerWidget(
                        index: index,
                      );
                    }),
                  ),
                ),
              ),
            ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 GestureDetector(
//                   onTap: ()async {
                   
//                    _.ref = await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").add({"gameNamw":_.gameNameController.text});
//              _.update();

//                                final usersTwow =await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").doc(_.ref!.id).collection("players");
                      
//                 for (var player in _.playersList){

//                   final playerlists = {
//                   "name":player.name ,
//                   "buyin":player.buyIn,
//                   "amount":player.amount,
//                   "address":player.addresses.map((addr) => addr.toJson()).toList(),
//                   "finalStack":player.finalAmount,
//                   "gameName":_.gameNameController.text,
//                   "lastAmount":player.lastAmount,

          

//                   };





// await  usersTwow.add(playerlists);
//                 }

//                 final whoPays =await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").doc(_.ref!.id).collection("WhoPaysWho");
//  for (var player in _.finals){






// await  whoPays.add(player);
//                 }

//                   },
//                   child: Container(
//                     width: 170,
//                     height: 55,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF626D94),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Save",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w800,
//                           fontFamily: 'OpenSans',
//                           color: Colors.white
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 170,
//                   height: 55,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF626D94),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Share",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w800,
//                         fontFamily: 'OpenSans',
//                         color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),


//  ElevatedButton(
//               child: Text(
//                 'Capture Above Widget',
//               ),
//               onPressed: () {
//                 screenshotController
//                     .capture(delay: Duration(milliseconds: 10))
//                     .then((capturedImage) async {

//                         ShowCapturedWidget(context,  capturedImage!);
//                 setState(() {
//                    _imageFile = capturedImage; 
//                 });
                 

//                 }).catchError((onError) {
//                   print(onError);
//                 });
//               },
          //  ),
SizedBox(height: 20,),
//  Row(
//    children: [
//      GestureDetector(
//       onTap: () {
//          screenshotController
//                     .capture(delay: Duration(milliseconds: 10))
//                     .then((capturedImage) async {

//                         ShowCapturedWidget(context,  capturedImage!);
//                 setState(() {
//                    _imageFile = capturedImage; 
//                 });
                 

//                 }).catchError((onError) {
//                   print(onError);
//                 });
//       },
//        child: Container(
//                         width: 170,
//                         height: 55,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF626D94),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "History",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w800,
//                               fontFamily: 'OpenSans',
//                               color: Colors.white
//                             ),
//                           ),
//                         ),
//                       ),
//      ),
//      GestureDetector(
//       onTap: () {
//          Get.to(()=>History());
//       },
//        child: Container(
//                         width: 170,
//                         height: 55,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF626D94),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "History",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w800,
//                               fontFamily: 'OpenSans',
//                               color: Colors.white
//                             ),
//                           ),
//                         ),
//                       ),
//      ),
//    ],
//  ),
             GestureDetector(
            
            child: Text("")),
            // Container with height 67
            GestureDetector(
             onTap: () async{
                 _.ave.clear();
    _.aveTwo.clear();
    // count = 0;
    // name = "";
    _.winner.clear();
    _.losser.clear();
    _.finals.clear();
           for (var i in _.playersList){
            if(i.lastAmount > 0  ){
              
                _.winner[i.name] = i.lastAmount;



               
            }
            if(i.lastAmount <0){
       
                 _.losser[i.name] = i.lastAmount;

            

            }

           }
           print(_.playersList.length);
               print("Loser" + "${_.losser}");
            print("Winner" + "${_.winner}");
          int count = 0;
          String name = "";
          int amounts = 0;

    for (var winnerEntry in _.winner.entries) {
  var winnerName = winnerEntry.key;
  var winnerAmount = winnerEntry.value;

  if (name != "") {
    _.losser[name] = amounts;
    amounts =0;
    name = "";
    _.update();
  }
  
  print("|" + "${_.aveTwo}");
  print("dasdasd" + "${!_.aveTwo.contains(winnerName)}");

  print("winnerrrrrrrrrrrrrrrrrrr" + "${winnerName}");

 if (!_.aveTwo.contains(winnerName)) {
    for (var losserEntry in _.losser.entries) {
      var losserName = losserEntry.key;
      var losserAmount = losserEntry.value;

      print(winnerAmount);
      print(losserAmount.abs());
 
  print("cvconet" + "${!_.ave.contains(losserName) && !_.aveTwo.contains(winnerName)}");
      if (!_.ave.contains(losserName) && !_.aveTwo.contains(winnerName)) {
      
        if (winnerAmount > losserAmount.abs()) {
          _.finals.add({
            "winnerName": winnerName,
            "losserName": losserName,
            "Amount": losserAmount.abs(),
          });
          _.update();

          count = winnerAmount - losserAmount.abs();
          _.ave.add(losserName);
          _.update();
        }

        if (winnerAmount < losserAmount.abs()) {
          if (count != 0) {
            winnerAmount = count;
            count = 0;
          }

          _.finals.add({
            "winnerName": winnerName,
            "losserName": losserName,
            "Amount": winnerAmount,
          });

          _.update();
          name = losserName;
          amounts = losserAmount.abs() - winnerAmount;
          print("ASDASd" + "${amounts}");
          _.aveTwo.add(winnerName);
 
        }

        if (winnerAmount == losserAmount.abs()) {
          _.finals.add({
            "winnerName": winnerName,
            "losserName": losserName,
            "Amount": losserAmount.abs(),
          });

          _.ave.add(losserName);
          _.aveTwo.add(winnerName);
  
        }
      }
    }
  }
}



        
          
//           _.winner.forEach((winnerName, winnerAmount) {
//                    if(name != "" ){
//                     _.losser[name] = amounts;
//                     _.update();
//                    }

//                    if(!_.aveTwo.contains(winnerName)) {
// _.losser.forEach((losserName, losserAmount) {


//                   print(winnerAmount);
//                   print(losserAmount.abs());
//            print(winnerAmount > losserAmount.abs());
//            print(winnerAmount < losserAmount.abs());
//    if(!_.ave.contains(losserName)){
// if(winnerAmount >   losserAmount.abs()){

//   _.finals.add(
//     {"winnerName":winnerName,"losserName":losserName,"Amount":losserAmount.abs()},

    
//     );
//     _.update();

//   count = winnerAmount - losserAmount.abs();
  
//   //  _.losser.remove(losserName);
//      _.ave.add(losserName);
//      _.update();
        
// }

// if(winnerAmount < losserAmount.abs()) {
//  if(count != 0 ) {
//   winnerAmount = count;
//   count = 0;
//  }

// _.finals.add(
//     {"winnerName":winnerName,"losserName":losserName,"Amount":winnerAmount},

    
//     );


//     _.update();
// name = losserName;
// amounts = losserAmount.abs() - winnerAmount;
// print("ASDASd" + "${amounts}");
// _.aveTwo.add(winnerName);


// }


// if(winnerAmount == losserAmount.abs()) {
 

// _.finals.add(
//     {"winnerName":winnerName,"losserName":losserName,"Amount":losserAmount.abs()},

    
//     );
   
// _.ave.add(losserName);
// _.aveTwo.add(winnerName);

// }
//    }                



//               }
              
              
//               );
//                    }
              
             

                      
//               // print(_.losser);
//           });
 
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
               print(_.finals);
                print(_imageFile); 
             Get.to(()=>WhoPay(image:_imageFile));
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
                    "Transactions",
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
            
            SizedBox(height: 50,),
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
                             
                          isExpanded=!isExpanded;
                          setState(() {
                            
                          });
                
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


