import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/finalSummary.dart';
import 'package:poker/newnew.dart';



class ContainerSelectionScreen extends StatefulWidget {

  @override
  _ContainerSelectionScreenState createState() =>
      _ContainerSelectionScreenState();
}

class _ContainerSelectionScreenState extends State<ContainerSelectionScreen> {
  int selectedContainerIndex = -1; // Initialize with -1 to indicate no selection.
  List<TextEditingController> evenTextControllers = [];
  @override
  void dispose() {

     for (var controller in evenTextControllers) {
      controller.dispose();
    }
    // TODO: implement dispose
    super.dispose();
   
  }
  @override
  Widget build(BuildContext context) {
    DataController _ = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: Text("ASD"),
      ),
      backgroundColor: Color(0xFF505771), // Background color is #505771
      body: Column(
        children: <Widget>[
 
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // IconButton(
                //   icon: Icon(
                //     Icons.arrow_back,
                //     color: Colors.white,
                //   ),
                //   onPressed: () {
                //     // Implement back button functionality
                //   },
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.delete,
                //     color: Colors.white,
                //   ),
                //   onPressed: () {
                //     // Implement delete button functionality
                //   },
                // ),
              ],
            ),
          ),
                   Container(
            color: Color(0xFF626D94), // Container color is #626D94
            height: 45.0,
            width: double.infinity, // Full width
            child: Center(
              child: Row(
                children: [
                  Text(
                    'Player',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                   Text(
                    'Final Stack',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 600,
            width: 600,
            
            child: ListView.builder(
              itemCount: _.playersList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                         color: selectedContainerIndex == index
                                ? Color(0xFF85A18A) // Selected color is #85A18A
                                : Color(0xFF505771) ,
                      ),
                                       // Default color is #505771
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:70.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Text(_.playersList[index].name,style: TextStyle( fontSize: 20.0,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,),),
                            Container(
                              height: 40.0,
                              width: 100,
                              
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: selectedContainerIndex == index
                                    ? Colors.white // Selected color is #85A18A
                                    : Colors.white, // Default color is #505771
                          
                              ),
                              child: Center(
                                child: TextFormField(
                                  
                              // controller:evenTextControllers[index] ,
                                  decoration: InputDecoration(
                                    
                                    hintText: 'Amount',
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value){
                                 _.playersList[index].finalAmount   =value;
                                 _.playersList[index].time   =DateTime.now().toString();
                                 print(  _.playersList[index].time);
                              
                                  }
                                  ,
                                  style: TextStyle(
                                    color: Colors.black,
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
              },
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.to(()=>FinalSummary());
            },
            child: Text("data"))
        ],
      ),
    );
  }
}
