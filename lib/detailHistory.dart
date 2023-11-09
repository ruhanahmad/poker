import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poker/finalStack.dart';

import 'package:poker/models/player_model.dart';
import 'package:poker/whoPay.dart';

import 'controllers/data_controller.dart';

class HistoryDetail extends StatefulWidget {
 String id;
  HistoryDetail({required this.id});

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  List<Container> buyInsList = [];

 

  int n = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    DataController _ = Get.find();
    return Scaffold(
      appBar: AppBar(
        // title: Row(
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
            Text("History",
                style: const TextStyle(  fontSize: 40.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 50.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(DateTime.now().toString().split(' ')[0],
                //           style: const TextStyle(
                //             color: Colors.grey,
                //           )),
                //       Row(
                //         children: [
                //           const Text('Buy In: ',
                //               style: TextStyle(
                //                 color: Colors.grey,
                //               )),
                //           // Replace '120' with the actual buy-in value from the previous screen
                //           Text(_.buyInController.text,
                //               style: const TextStyle(
                //                 color: Colors.grey,
                //               )),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Player', style: TextStyle(fontSize: 15,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
                  //  Spacer(),
                    Text('Buy In',
                        style: TextStyle(fontSize: 15,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
                 //   Spacer(),
                    Text('Buy Out',
                        style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)
                        ),

                       //   Spacer(),
                            Text('Net',
                        style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)
                        ),
                  //   Text('Net',
                  //       style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                  //       fontWeight: FontWeight.w800,
                  //       color: Colors.white,)),
                  ],
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                // startDate == null || endDate == null ? 
                FirebaseFirestore.instance.collection('users').doc(_.nn).collection('games').doc(widget.id).collection("players")
                //   .where('saved', isEqualTo: 
                // "yes")
                  .snapshots(),
                  // :
       
                builder: (context, subSnapshot) {
                  if (subSnapshot.hasData) {
                    final subDocs = subSnapshot.data!.docs;
                    // Process and display data from the sub-collection
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: subDocs.length,
                      itemBuilder: (context, subIndex) {
                        final subDoc = subDocs[subIndex];
                        final name = subDoc['name'];
                        final buyIn =subDoc["buyin"];
                       
                        final ids = subDoc.id;
                      final buyOut =subDoc["finalStack"];
                       final lastAmount =subDoc["lastAmount"];
                       
                         

                        return 
                                Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          
                        
                        },
                        child: Container(
                          //  decoration: BoxDecoration(
                          //                  borderRadius: BorderRadius.circular(10),
                          //                  color: Colors.green.withOpacity(0.2),
                          //                ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 40),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                             Text(" ${name} ", style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,) ),
                            //   SizedBox(height: 5,),
                            
                              
                                Text(" ${buyIn} " , style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
                              
                               Text(" ${buyOut} " , style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),  
                        
                  // Text("|" , style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                  //       fontWeight: FontWeight.w800,
                  //       color: Colors.white,)),  
                  //       SizedBox(width: 15,),
                               Text("${lastAmount}" , style: TextStyle(fontSize:15.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
                             
                            //    Column(
                              
                            //    children: [
                                 
                            //                          //  Text( formattedDate  ),
                            //                          //  SizedBox(height: 5,),
                            //                          //    Text( formattedTime  ),
                             
                            //  ],),
                             
                             
                            ],),
                          ),
                        ),
                      ),
                    );
                      },
                    );
                  } else if (subSnapshot.hasError) {
                    return Text('Error: ${subSnapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),

              StreamBuilder<QuerySnapshot>(
                stream:
                // startDate == null || endDate == null ? 
                FirebaseFirestore.instance.collection('users').doc(_.nn).collection('games').doc(widget.id).collection("Who")
                //   .where('saved', isEqualTo: 
                // "yes")
                  .snapshots(),
                  // :
       
                builder: (context, subSnapshot) {
                  if (subSnapshot.hasData) {
                    final subDocs = subSnapshot.data!.docs;
                    // Process and display data from the sub-collection
                    return Container(
                      height: 148,
                      width: 395,
                      decoration: BoxDecoration(
                        color: Color(0xFF626D94),
                        borderRadius: BorderRadius.circular(25)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: subDocs.length,
                        itemBuilder: (context, subIndex) {
                          final subDoc = subDocs[subIndex];
                          final winner = subDoc['winnerName'];
                          final losser =subDoc["losserName"];
                         
                          final ids = subDoc.id;
                        final Amount =subDoc["Amount"];
                      
                         
                           
                    
                          return 
                                  Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            
                          
                          },
                          child: Container(
                            //  decoration: BoxDecoration(
                            //                  borderRadius: BorderRadius.circular(10),
                            //                  color: Colors.green.withOpacity(0.2),
                            //                ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                Center(
                              child: Container(height: 400,width: MediaQuery.of(context).size.width,
                              
                              child: ListView.builder(
                      itemCount: subDocs.length,
                      itemBuilder: ((context, index) {
                        return
                                      Container(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                       Text("${losser}",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'OpenSans',
                          color: Colors.white,),),
                          SizedBox(width: 40,),
                          Column(
                            children: [
                               Text("${Amount}".toString(),style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'OpenSans',
                          color: Colors.white,),),
                                       
                              Container(height: 50,width:100,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/arrows.png"))),),
                            ],
                          ),
                            SizedBox(width: 40,),
                         Text("${winner}",style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'OpenSans',
                          color: Colors.white,),),
                          
                            
                      ],),
                                      ),);  
                                       
                      
                      }),
                                      ),
                              ),
                            ),
                               
                                
                               
                               
                              ],),
                            ),
                          ),
                        ),
                      );
                        },
                      ),
                    );
                  } else if (subSnapshot.hasError) {
                    return Text('Error: ${subSnapshot.error}');
                  
                  }
                  // else if (!subSnapshot.hasData) {
                  //   return Text("No Details");
                  // }
                  
                   else {
                    return CircularProgressIndicator();
                  }
                },
              ),
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
            

           
            SizedBox(height: 50,),
          ],
        ),
      ),
     
    );
  }
}


