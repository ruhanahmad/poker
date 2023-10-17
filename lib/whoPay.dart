import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/finalStack.dart';

import 'package:poker/models/player_model.dart';

import 'controllers/data_controller.dart';

class WhoPay extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    DataController _ = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Back', style: TextStyle(color: Colors.white)),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
              Get.to(()=>ContainerSelectionScreen())  ;
     
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: const Text('Start'),
            ),
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
            Text("${_.gameNameController.text}",
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
                          Text('Game Time: ',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                                Text("00:00:00",
                          style: const TextStyle(
                            color: Colors.grey,
                          )),
                        ],
                      ),
                      // Replace '120' with the actual buy-in value from the previous screen
                    
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
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Who do I Pay?', style: TextStyle(fontSize: 20,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF97EEA5),)),
                  ),
                
                ],
              ),
            ),
            // Expanded(
            //   child: Obx(
            //     () => 
            //     ListView.builder(
            //       itemCount: _.playersList.length,
            //       itemBuilder: ((context, index) {
            //         return PlayerWidget(
            //           index: index,
            //         );
            //       }),
            //     ),
            //   ),
        //     // ),
        //  Text("${_.finals}"),
        SizedBox(height: 70,),
        Center(
          child: Container(height: 400,width: MediaQuery.of(context).size.width,
          
          child: ListView.builder(
                    itemCount: _.finals.length,
                    itemBuilder: ((context, index) {
                      return
                  Container(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                     Text(_.finals[index]["losserName"],style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                        color: Colors.white,),),
                        SizedBox(width: 40,),
                        Column(
                          children: [
                             Text(_.finals[index]["Amount"].toString(),style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                        color: Colors.white,),),
                   
                            Container(height: 50,width:100,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/arrows.png"))),),
                          ],
                        ),
                          SizedBox(width: 40,),
                       Text(_.finals[index]["winnerName"],style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                        color: Colors.white,),),
                        
                          
                    ],),
                  ),);  
                   
                    
                    }),
                  ),
          ),
        ),
   
        GestureDetector(
                  onTap: ()async {
                    List<String> newjik = [];
                   newjik=  _.playersList.map((element) => 
                      element.name
                     ).toList(); 

                 Map<String, dynamic> gameData = {
  "gameName": _.gameNameController.text,   // Replace with your game name
  "playerName": newjik,
  "date":DateTime.now(),
  
   // List of player names
};
                   _.ref = await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").add(gameData);
             _.update();

                               final usersTwow =await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").doc(_.ref!.id).collection("players");
                      
                for (var player in _.playersList){

                  final playerlists = {
                  "name":player.name ,
                  "buyin":player.buyIn,
                  "amount":player.amount,
                  "address":player.addresses.map((addr) => addr.toJson()).toList(),
                  "finalStack":player.finalAmount,
                  "gameName":_.gameNameController.text,
                  "lastAmount":player.lastAmount,

          

                  };




await  usersTwow.add(playerlists);
                }

                final whoPays =await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").doc(_.ref!.id).collection("WhoPaysWho");
 for (var player in _.finals){






await  whoPays.add(player);
                }

                  },
                  child: Container(
                    width: 170,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFF626D94),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'OpenSans',
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
SizedBox(height: 10,),

          
            // Container with height 67
            GestureDetector(
             onTap: (){
 
              // Get.to(()=>FinalSummary());
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
                    "Share",
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
        duration: const Duration(milliseconds: 250),
        height: isExpanded?size.width*.5: size.width * .1,
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
              SizedBox(height: size.width*.0125,),
              // Divider(
              //   thickness: 1,
              //   color: Color(0xffB4B4B4),),
            
       AnimatedContainer(
            duration: const Duration(microseconds: 250),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: const Color(0xFF626D94),
              borderRadius: BorderRadius.circular(10.0),
            ),
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
                                         Text('${data.addresses[i].time}',style: TextStyle(color: Colors.green, ),),
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


