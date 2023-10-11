import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/finalStack.dart';

import 'package:poker/models/player_model.dart';

import 'controllers/data_controller.dart';

class FinalSummary extends StatelessWidget {
  List<Container> buyInsList = [];







  int n = 0;





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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                Container(
                  width: 170,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF626D94),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Share",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'OpenSans',
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
SizedBox(height: 20,),
            // Container with height 67
            Container(
              width: 281,
              height: 67,
              decoration: BoxDecoration(
                color: Color(0xFFF0A637),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'OpenSans',
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