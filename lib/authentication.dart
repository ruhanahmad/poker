import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/homepage.dart';
import 'package:poker/signUp.dart';



class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DataController _ = Get.put(DataController());
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
             Container(height: 146,width:222,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/pokercalculator.png"))),),
              Text("Welcome",
                style: const TextStyle(  fontSize: 32.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)
                        ),
                         Text("Sign in to Continue",
                style: const TextStyle(  fontSize: 14.0,fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(height: 57,width:57,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/user.png"))),),
                  Container(
                    height: 40,
                    width: 291,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                           border: InputBorder.none, // Remove the underline
                          hintText: 'Email'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(height: 57,width:57,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/password.png"))),),
                Container(
                  height: 40,
                  width: 291,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText:true,
                      decoration: InputDecoration(
                        
                         border: InputBorder.none, // Remove the underline
                        hintText: 'Password'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
               style: ButtonStyle(

                backgroundColor: MaterialStateProperty.all(Color(0xFFF0A637)),
    minimumSize: MaterialStateProperty.all(
      
      Size(105, 51),), // Set the width and height
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
       // Set the border radius
    )),
    // Add other styles as needed
  ),
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  _.nn =  userCredential.user!.uid;
                  _.update();
                //  await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).collection("games").add({});
                 
                //  final users =await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid);
//                   _.playersList.map((player)async {
// final playerlistss ={
//                   "name":player.name ,
//                   "buyin":player.buyIn,
//                   "amount":player.amount,
//                   "address":player.addresses.map((addr) => addr.toJson()).toList(),
       
// };
      
               Get.to(()=>MyApp());

//                   });
                  
                  
                } catch (e) {
                  print('Error signing in: $e');
                }
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: () {
                Get.to(()=>AuthSignUp());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("or",style: const TextStyle(  fontSize: 14.0,fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800,
                              color: Colors.white,)),
                                Text("Create An Account",style: const TextStyle(  fontSize: 14.0,fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF6486FF))),
                ],
              ),
            ),
            
            // ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       UserCredential userCredential =
            //           await _auth.createUserWithEmailAndPassword(
            //         email: _emailController.text,
            //         password: _passwordController.text,
            //       );
            //       print('Signed up: ${userCredential.user!.email}');
            //       Get.to(()=>AuthScreen());
            //     } catch (e) {
            //       print('Error signing up: $e');
            //     }
            //   },
            //   child: Text('Sign Up'),
            // ),
          ],
        ),
      ),
    );
  }
}
