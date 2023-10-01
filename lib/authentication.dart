import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/homepage.dart';



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
      appBar: AppBar(
        title: Text('User Login Signup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
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
                  print('Signed in: ${userCredential.user!.email}');
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
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  print('Signed up: ${userCredential.user!.email}');
                  Get.to(()=>AuthScreen());
                } catch (e) {
                  print('Error signing up: $e');
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
