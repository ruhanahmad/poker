import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/finalStack.dart';

import 'package:poker/models/player_model.dart';
import 'package:intl/intl.dart';

import 'controllers/data_controller.dart';

class ThirdScreen extends StatelessWidget {
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

 DataController _ = Get.find();
    Future<void>? alerts(BuildContext context,int leng){
    showDialog(context: context, builder: (context){
      return     AlertDialog(
        content: 
         Column(
           children: [
             Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
                child: Obx(
                  () => ListView.builder(
                    itemCount: _.playersList.length,
                    itemBuilder: ((context, index) {
                      return 
                      PlayerWidgets(
                        index: index,
                      );
                    }),
                  ),
                ),
              ),
               ElevatedButton(
          onPressed: () {
          
              _.playersList.add(Player(name: "", buyIn: 0, amount: 0,addresses: [],finalAmount: 0,time: "",lastAmount: 0));
              return;
            

          },
          style: ElevatedButton.styleFrom(primary: const Color(0xFF7D37F0)),
          child: const Text('Add'),
        ),
        
                      ElevatedButton(
          onPressed: () {
            Get.to(()=>ThirdScreen());
          
              // _.playersList.add(Player(name: "", buyIn: 0, amount: 0,addresses: []));
              // return;
            

          },
          style: ElevatedButton.styleFrom(primary: const Color(0xFF7D37F0)),
          child: const Text('OK'),
        ),
           ],
         ),
      );
    });
  }
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
            Text(_.gameNameController.text,
                style: const TextStyle(color: Colors.white, fontSize: 40.0)),
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
                    Text('Players', style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Text(' Total Buy Ins',
                        style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Text('Numerical Amount ',
                        style: TextStyle(color: Colors.white)),
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
      ),
      bottomNavigationBar: SafeArea(
        child: ElevatedButton(
          onPressed: () async{


     await   alerts(context,_.playersList.length);
              // _.playersList.add(Player(name: "", buyIn: 0, amount: 0,addresses: []));
       
            
   
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
    double showvalues = 1;

  toggleBar(bool nice) {


  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    {
      final data = _.playersList[widget.index];

      return 
      AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: isExpanded?size.width*.9: size.width * .1,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: const Color(0xff626D94),
          borderRadius: BorderRadius.circular(10.0),
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
                        data.buyIn.toString(),
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
                    ],
                  ),
                ),
                 Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cyclone_outlined,color: Color(0xff97EEA5),),
                      InkWell(
                        onTap: (){
                          isExpanded=!isExpanded;
                          setState(() {
                            
                          });
                        },
                        child: Icon(isExpanded?Icons.keyboard_arrow_up: Icons.keyboard_arrow_down,color: Color(0xff97EEA5),),),
            
                    ],
                  ),
                ),
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
              Divider(
                thickness: 1,
                color: Color(0xffB4B4B4),),
            
       AnimatedContainer(
            duration: const Duration(microseconds: 250),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.all(10.0),
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
                    Text("Buy In",style: TextStyle(color: Color(0xffB4B4B4,),fontSize: 10),),
                     Text("Custom Amount",style: TextStyle(color: Color(0xffB4B4B4),fontSize: 10),),
                      Text("Cash in",style: TextStyle(color: Color(0xffB4B4B4),fontSize: 10),),
                       Text("Cash out",style: TextStyle(color: Color(0xffB4B4B4),fontSize: 10),)
                
                  ],),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 
                    const SizedBox(width: 10.0),
                    DropdownButton<int>(
                      items: List.generate(
                          300,
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

                        // fair ok ok ustad g
                        // Implement logic to handle dropdown selection
                      },
                      underline: Container(),
                      value: showvalue,
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      height: 30,
                      width: 80,
                      child: TextField(
                        controller: amountController,
                        onChanged: (txt) {
                          _.playersList[widget.index].addresses[widget.index].amount = int.parse(txt);
                    
                      

                          print(  _.playersList[widget.index].addresses[widget.index].amount);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Amount',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),

                    GestureDetector(
                      onTap: ()async{
                     
      // await FirebaseFirestore.instance.collection("users").doc(_.nn).collection("games").doc(_.ref!.id).collection("players");
 double n = double.parse(amountController.text)    / double.parse(_.buyInController.text);
                         setState(() {
                            
                  _.playersList[widget.index].amount  +=  int.parse(amountController.text)  ;
                       showvalues =  n ;   
                       print(showvalues);
                
                // double n =   _.playersList[widget.index].addresses[widget.index].amount /   _.playersList[widget.index].buyIn; 
                // print(n);
                // showvalues = n.toInt();
                          data.addresses.add(PlayerCashInOut(time: "${now.year.toString()}-${now.month.toString()}-${now.day.toString()}", buyIn:double.parse(showvalues.toStringAsFixed(2)), amount:int.parse(amountController.text) ,colors: "Colors.green" ));
                        //  toggleBar(true);
                          print(isGreen);
                          print(data.addresses);
                      //  mainRecord.addresses[widget.index].addresses.add
                        });
                        //  _.playersList.add(PlayerList(amount:  _.playerCashInOut[widget.index].amount ,buyIn: _.playerCashInOut[widget.index].amount ,time: ""));

                        //  print(_.playerCashInOut.length);
                      },
                      child: Container(height: 27,width: 32,decoration: BoxDecoration(color: Color(0xFF99A0BA),borderRadius: BorderRadius.circular(10)),child: Icon(Icons.add,color: Colors.green,),)),

                     SizedBox(
                      width: size.width * .05,
                    ),

                    GestureDetector(
                      onTap: (){
                         double n = double.parse(amountController.text)    / double.parse(_.buyInController.text);

                        setState(() {
                            _.playersList[widget.index].amount  -=  int.parse(amountController.text)  ;
                                showvalues =  n ;   
                          data.addresses.add(PlayerCashInOut(time: "${now.year.toString()}-${now.month.toString()}-${now.day.toString()}", buyIn: double.parse(showvalues.toStringAsFixed(2)), amount:int.parse(amountController.text) ,colors: "Colors.red"));

                          print(data.addresses);
                          // isGreen = false;
                          print(isGreen);
                      //  mainRecord.addresses[widget.index].addresses.add
                        });
                      },
                      
                      child: Container(height: 27,width: 32,decoration: BoxDecoration(color: Color(0xFF99A0BA),borderRadius: BorderRadius.circular(10)),child: Icon(Icons.navigate_before,color: Colors.red,))),
                   
                  ],
                ),
          //         Expanded(
          //   child: Obx(
          //     () => ListView.builder(
          //       itemCount: _.playerCashInOut.length,
          //       itemBuilder: ((context, index) {
          //         return 
          //         // Container();
          //         Container(
          //           height: 100,
          //           width: size.width,
          //           child: Row(children: [
          //           Text("${_.playerCashInOut[widget.index].amount}")
          //         ],),);
          //         // PlayerWidget(
          //         //   index: index,
          //         // );
          //       }),
          //     ),
          //   ),
          // ),

    //        for (final addressRecord in  data.addresses)
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: data.addresses.length,
                itemBuilder:(context,i){
            return                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 55,
                            width: 397,
                          //  padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0XFF99A0BA)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:3.0),
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                     Text('${data.addresses[i].time}',style: TextStyle(color: Colors.white ),),
                                  Text('${data.addresses[i].amount}',style: TextStyle(color: data.addresses[i].colors == "Colors.red" ?Colors.red:Colors.green),),
                                  Text('${data.addresses[i].buyIn}'),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      data.addresses.removeAt(i);
                                    });
                                  }, icon:Icon( Icons.delete))
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


class PlayerWidgets extends StatefulWidget {
  final index;

  const PlayerWidgets({super.key, required this.index});

  @override
  State<PlayerWidgets> createState() => _PlayerWidgetsState();
}

class _PlayerWidgetsState extends State<PlayerWidgets> {
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isEditing) {
      final data = _.playersList[widget.index];
      nameController.text = data.name;
      amountController.text = data.amount.toString();
      return Container(
        // margin: const EdgeInsets.symmetric(vertical: 5.0),
        // padding: const EdgeInsets.all(5.0),
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
            DropdownButton<int>(
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
//abhi to thek hay na?
//yes acha ab vo animated container banana bnao na darling
//ok
                //phly hgya tha pr jb mai dbara screen load krti to error ajata tha
                // Implement logic to handle dropdown selection
              },
              underline: Container(),
              value: showvalue,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: amountController,
                onChanged: (txt) {
                  _.playersList[widget.index].amount = int.parse(txt);
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
                setState(() {});
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
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: savedIcon ? const Color(0xff85A18A) : const Color(0xFFB6B07B),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
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
                    data.buyIn.toString(),
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
                //     if (!savedIcon)
                //       IconButton(
                //           onPressed: () {
                //             setState(() {
                //               isDelete = true;
                //         //       Future.delayed(Duration(microseconds: 200)).then((value) {
                //         //    isDelete = false;
                //         // });
                //             });
                //             Future.delayed(const Duration(milliseconds: 1000)).then((value) {
                //   isDelete = false;
                //   setState(() {});
                // });
                             
                //           },
                //           icon: const Icon(
                //             Icons.delete_outline_rounded,
                //             color: Colors.white,
                //           ))
                  ],
                ),
              ),
          ],
        ),
      );
    }
  }
}