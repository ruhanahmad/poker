import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/finalSummary.dart';
import 'package:poker/finalSummarytwo.dart';
import 'package:poker/newnew.dart';
import 'package:poker/test.dart';
import 'package:poker/webvioew.dart';



class ContainerSelectionScreen extends StatefulWidget {

  @override
  _ContainerSelectionScreenState createState() =>
      _ContainerSelectionScreenState();
}

class _ContainerSelectionScreenState extends State<ContainerSelectionScreen> {
  int selectedContainerIndex = -1; // Initialize with -1 to indicate no selection.
  List<TextEditingController> evenTextControllers = [];
    DataController _ = Get.put(DataController());
  @override
  void dispose() {

     for (var controller in evenTextControllers) {
      controller.dispose();
    }
    // TODO: implement dispose
    super.dispose();
   
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   print( _.playersList.first.finalAmount);

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
                                 _.playersList[index].finalAmount   =int.parse(value);
                                 _.playersList[index].time   =DateTime.now().toString();
                               _.playersList[index].lastAmount=  _.playersList[index].finalAmount - _.playersList[index].amount;
                              
                                 print(  _.playersList[index].lastAmount);
                              
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
         setState(() {
          
            //  _.playersList[widget.index].amount  -=  int.parse(amountController.text)  ;
         });
                  Get.to(()=> FinalSummary());
              // Get.to(()=>FinalSummary());
            },
            child: Text("data")),


             GestureDetector(
            onTap: (){
           for (var i in _.playersList){
            if(i.amount > 0  ){
              
                _.winner[i.name] = i.amount;



               
            }
            if(i.amount <0){
       
                 _.losser[i.name] = i.amount;

            

            }

           }
           print(_.playersList.length);
               print("Loser" + "${_.losser}");
            print("Winner" + "${_.winner}");
          int count = 0;
          String name = "";
          int amounts = 0;
          
          _.winner.forEach((winnerName, winnerAmount) {
                   if(name != "" ){
                    _.losser[name] = amounts;
                    _.update();
                   }
              _.losser.forEach((losserName, losserAmount) {


                  print(winnerAmount);
                  print(losserAmount.abs());
           print(winnerAmount > losserAmount.abs());
           print(winnerAmount < losserAmount.abs());
   if(!_.ave.contains(losserName)){
if(winnerAmount >   losserAmount.abs()){

  _.finals.add(
    {"winnerName":winnerName,"losserName":losserName,"Amount":losserAmount.abs()},

    
    );
    _.update();

  count = winnerAmount - losserAmount.abs();
  
  //  _.losser.remove(losserName);
     _.ave.add(losserName);
     _.update();
        
}

if(winnerAmount < losserAmount.abs()) {
 if(count != 0 ) {
  winnerAmount = count;
  count = 0;
 }

_.finals.add(
    {"winnerName":winnerName,"losserName":losserName,"Amount":winnerAmount},

    
    );
    _.update();
name = losserName;
amounts = losserAmount.abs() - winnerAmount;
print("ASDASd" + "${amounts}");


}

if(winnerAmount == losserAmount.abs()) {
 

_.finals.add(
    {"winnerName":winnerName,"losserName":losserName,"Amount":losserAmount.abs()},

    
    );
   
_.ave.add(losserName);

}
   }                



              }
              
              
              );
             

                      
              // print(_.losser);
          });
               print(_.finals);
              // Get.to(()=>FinalSummary());
            },
            child: Text("Function"))
        ],
      ),
    );
  }
}
