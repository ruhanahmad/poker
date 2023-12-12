import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:poker/authentication.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/history.dart';
import 'package:poker/homepage.dart';
import 'package:poker/shared.dart';
import 'package:poker/signUp.dart';



class ChooseGamesScreen extends StatefulWidget {
  @override
  _ChooseGamesScreenState createState() => _ChooseGamesScreenState();
}

class _ChooseGamesScreenState extends State<ChooseGamesScreen> {


  @override
  Widget build(BuildContext context) {
    DataController _ = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF505771),
        title: Text("Welcome",style: TextStyle(fontStyle: FontStyle.italic,color: const Color.fromARGB(255, 248, 248, 248),fontSize: 14),),
        actions: [
           ElevatedButton(
           style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF505771)), // Change this to your desired color
  ),
                  onPressed: ()async{
                      await FirebaseAuth.instance.signOut();
                      Get.to(()=>AuthScreen());
                    PreferencesManager.instance.removeUserName();
                  },
                  child: Text('Log out',style: TextStyle(color: Color(0xFFC2BABA),fontSize: 14),),
                ),
        ],
      ),
      backgroundColor: const Color(0xFF505771),
      // appBar: AppBar(
      //   title: Text('User Login Signup'),
      //     backgroundColor: const Color(0xFF505771),
      //     elevation: 0,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(height: 146,width:222,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/pokercalculator.png"))),),
              Text("Poker Calculator",
                style: const TextStyle(  fontSize: 32.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)
                        ),
                       SizedBox(height: 20,),
                       GestureDetector(
                        onTap: (){
                          Get.to(()=>MyApp());
                        },
                         child: Container(
                          
                          width: 291,height: 80,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                         color: Color(0xFF677092),
                       
                         ),
                                            
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal:30.0),
                           child: Row(
                             children: [
                                                Container(height: 35,width: 35,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/casino.png"),fit: BoxFit.cover)),),
                                                SizedBox(width:50,),
                               Center(
                                 child: Text("Poker",    style: const TextStyle(  fontSize: 24.0,fontFamily: 'Open Sans',
                                                       fontWeight: FontWeight.w800,
                                                       color: Colors.white,)),
                               ),
                             ],
                           ),
                         ),
                         ),
                       ),

SizedBox(height: 20,),

                       GestureDetector(
                        onTap: (){
                   Get.to(()=>History());  
                        },
                         child: Container(
                          
                          width: 291,height: 80,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                         color: Color(0xFF677092),
                       
                         ),
                                            
                         child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:30.0),
                           child: Row(
                             children: [
                                                Container(height: 35,width: 35,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/posts.png"),fit: BoxFit.cover)),),
                                                SizedBox(width:20,),
                               Center(
                                 child: Text("History/Ledger",    style: const TextStyle(  fontSize: 24.0,fontFamily: 'Open Sans',
                                                       fontWeight: FontWeight.w800,
                                                       color: Colors.white,)),
                               ),
                             ],
                           ),
                         ),
                         ),
                       ),
                       SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
