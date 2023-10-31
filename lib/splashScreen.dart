import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:poker/authentication.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/homepage.dart';
import 'package:poker/signUp.dart';



class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => AuthScreen(), // Replace with your main content screen
      ));
    });
  }
  
  @override

  
  Widget build(BuildContext context) {

 
    return Scaffold(
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
             Container(height: 166,width:252,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/pokercalculator.png"))),),
              Text("Poker Calculator",
                style: const TextStyle(  fontSize: 32.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)
                        ),
                       
            
          ],
        ),
      ),
    );
  }
}
