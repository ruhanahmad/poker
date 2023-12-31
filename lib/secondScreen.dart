import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poker/models/player_model.dart';
import 'package:poker/thirdScreen.dart';

import 'controllers/data_controller.dart';

class SecondScreen extends StatelessWidget {
  List<Container> buyInsList = [];

  List<bool> isEditing = [];

  List<TextEditingController> oddTextControllers = [];
  List<TextEditingController> evenTextControllers = [];

  @override
  void dispose() {
    for (var controller in oddTextControllers) {
      controller.dispose();
    }
    for (var controller1 in evenTextControllers) {
      controller1.dispose();
    }
  }

  int n = 0;

  void toggleEdit(int index) {
    isEditing[index] = !isEditing[index];
  }

  @override
  Widget build(BuildContext context) {
    DataController _ = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//             const Text('Back', style: TextStyle(color: Colors.white)),
//             const Spacer(),
//             TextButton.icon(
//               onPressed: () async{
//       //           final qq = _.playersList.toList();
//       //            for (var ll in qq) {
//       //                       print(ll.name);
//       //                    }

//       //  final nn =    _.playersList.map((element) {
//       //                   //  print(element.name) ;

//       //                     // print(element.name);
//       //                     // print(element.buyIn);
                         
//       //                    }).toList();
                        
// //              _.ref = await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").add({"gameNamw":_.gameNameController.text});
// //              _.update();

// //                                final usersTwow =await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").doc(_.ref!.id).collection("players");
                      
// //                 for (var player in _.playersList){

// //                   final playerlists = {
// //                   "name":player.name ,
// //                   "buyin":player.buyIn,
// //                   "amount":player.amount,
// //                   "address":player.addresses.map((addr) => addr.toJson()).toList(),
// //                   "finalStack":"",
// //                   "gameName":_.gameNameController.text

          

// //                   };

// // await  usersTwow.add(playerlists);
// //                 }
              
//                 _.startTime = DateTime.now();

//                 Get.to(()=>ThirdScreen());
//                 // Implement the logic to proceed to the next screen
//               },
//               icon: const Icon(Icons.arrow_forward, color: Colors.white),
//               label: const Text('Start'),
//             ),


 Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 GestureDetector(
 onTap: () {
   Get.back();
 },
 child: 
 Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/back.png"))),)
 
 ),
         SizedBox(width: 30,),
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

                   
            


                                      GestureDetector(
                      onTap: () {
                          _.startTime = DateTime.now();

                Get.to(()=>ThirdScreen()); 
                      },
                      child: 
                      Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/start.png"))),)),




              
          ],
        ),
        backgroundColor: const Color(0xFF505771),
        elevation: 0, // No shadow under the app bar
      ),
      backgroundColor: const Color(0xFF505771),
      body: Column(
        
        children: [
          const Text('Starting Buy Ins',
              style: TextStyle(color: Colors.white, fontSize: 40.0
              ,
              fontFamily: 'OpenSans'
              )),
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
              padding: EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                children: [
                  Text('Players', style: TextStyle(color: Colors.white,fontFamily: 'OpenSans')),
                  SizedBox(width: 170,),
                  // Spacer(),
                  Text('Buy Ins', style: TextStyle(color: Colors.white,fontFamily: 'OpenSans')),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _.playersList.length,
                itemBuilder: ((context, index) {
                  return PlayerWidget(
                    index: index,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: 
        ElevatedButton(
          onPressed: () {
          //  if (_.playersList.length < _.maxPlayers.value) {
              _.playersList.add(Player(name: "", buyIn: 0, amount: 0,addresses: [],finalAmount: 0,time:"",lastAmount: 0));
            //  return;
          //  }
            // Get.closeAllSnackbars();
            // Get.snackbar("Player", "max player reached");
          },
          style: ElevatedButton.styleFrom(primary: const Color(0xFF7D37F0)),
          child: const Text('Add'),
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
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final DataController _ = Get.find();

  @override
  void initState() {
    if (_.playersList[widget.index].amount != 0) {
      isEditing = false;
      savedIcon = false;
    }
    super.initState();
  }
int showvalue =1;
double showvalues = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isEditing) {
      final data = _.playersList[widget.index];
      nameController.text = data.name;
      amountController.text = data.amount.toString();
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color(0xFF626D94),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: nameController,
                onChanged: (txt) {
                  _.playersList[widget.index].name = txt;
                },
                decoration: InputDecoration(
                  hintText: 'Name',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              // color: Colors.white,
              child: DropdownButton<int>(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                items: List.generate(
                    200,
                    (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text((index + 1).toString()),
                        )).toList(),
                onChanged: (value) {
                  _.playersList[widget.index].buyIn = value!;
                  _.playersList[widget.index].amount =
                      value * int.parse(_.buyInController.text);
                  amountController.text =
                      (value * int.parse(_.buyInController.text)).toString();

                  setState(() {
            
                    showvalue = value;
                    print(showvalue);
                  });
            
                },
                underline: Container(),
                value: showvalue,
                dropdownColor: Colors.white,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: amountController,
                onChanged: (txt) {
                  _.playersList[widget.index].amount = int.parse(txt);
                   double n = double.parse(txt)    / double.parse(_.buyInController.text);
                  _.playersList[widget.index].buyIn = n.toInt();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width*.05,),
            ElevatedButton(
              onPressed: () {
                isEditing = !isEditing;

                print(widget.index);
                double n = double.parse(amountController.text)    / double.parse(_.buyInController.text);
                setState(() {
                     _.playersList[widget.index].buyIn =  n ;   
                });
            //  data.buyIn = int.parse(n.toString());
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  savedIcon = false;
                  setState(() {});
                });
                // Implement logic for the 'OK' button
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF773BE0),
              ),
              child: Text(isEditing ? 'OK' : 'Edit'),
            ),
          ],
        ),
      );
    } else {
      final data = _.playersList[widget.index];

      return Container(
        height: size.width * .175,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: BoxDecoration(
          color: savedIcon ? const Color(0xff85A18A) : const Color(0xFFB6B07B),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50,),
                  Expanded(
                    flex: 2,
                    child: Text(
                      data.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Text(
                      data.buyIn.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text(
                      data.amount.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            if (isDelete)
              Expanded(
                  child: InkWell(
                      onTap: () {
                        _.playersList.removeAt(widget.index);

                       
                       
                      
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffFF4B4B

                          ),
                        ),
                        alignment: Alignment.center,
                        height: double.infinity,

                        child: const Text("Delete?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic),),
                      ))),
            if (!isDelete)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (savedIcon)
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cloud_done_rounded,
                            color: Colors.white,
                          )),
                    if (!savedIcon)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            savedIcon = true;
                            isEditing = !isEditing;
                          });
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                      ),
                    if (!savedIcon)
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isDelete = true;
                        //       Future.delayed(Duration(microseconds: 200)).then((value) {
                        //    isDelete = false;
                        // });
                            });
                            Future.delayed(const Duration(milliseconds: 1000)).then((value) {
                  isDelete = false;
                  setState(() {});
                });
                             
                          },
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.white,
                          ))
                  ],
                ),
              ),
          ],
        ),
      );
    }
  }
}
