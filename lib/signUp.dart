import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:poker/authentication.dart';
import 'package:poker/controllers/data_controller.dart';
import 'package:poker/homepage.dart';



class AuthSignUp extends StatefulWidget {
  @override
  _AuthSignUpState createState() => _AuthSignUpState();
}

class _AuthSignUpState extends State<AuthSignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

final TextEditingController _confirmPasswordController = TextEditingController();
final TextEditingController _userNameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final _formKey = GlobalKey<FormState>();
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
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
            
              children: <Widget>[
                      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(height: 24,width: 123,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/back.png"))),)),
                
                                  GestureDetector(
                    onTap: () {
                      // Get.back();
                    },
                    child: Row(
                      children: [
                        Container(height: 24,width: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/casino.png"))),),
                        Text("Poken Calculator",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w800,color: Colors.white),)
                      ],
                    )),
                ],),
                 Container(height: 146,width:222,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/pokercalculator.png"))),),
                  Text("Create An Account",
                    style: const TextStyle(  fontSize: 32.0,fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w800,
                            color: Colors.white,)
                            ),
                             Text("Start your Poker Calculator Journey",
                    style: const TextStyle(  fontSize: 14.0,fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w800,
                            color: Colors.white,)),

                            Column(
                            
                              children: [
                             Padding(
                                            padding: const EdgeInsets.symmetric(horizontal:9.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                 Container(height: 57,width:57,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/ph_user.png"))),),
                                                Container(
                                                  height: 40,
                                                  width: 291,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(25)),
                                                  
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                                              controller: _userNameController,
                                                                               
                                                                              decoration: InputDecoration(
                                                                                  contentPadding: EdgeInsets.symmetric(vertical:11),
                                                                              
                                                                                 // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                                 border: InputBorder.none,
                                                                                  // Remove the underline
                                                                                hintText: 'Username'),
                                                                                
                                                                                 validator: (value) {
                                                                                        if (value!.isEmpty) {
                                                                                          return 'Please enter your username.';
                                                                                        }
                                                                                        return null;
                                                                                              },
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
                                               Container(height: 57,width:57,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/email.png"))),),
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
                                                        contentPadding: EdgeInsets.symmetric(vertical:11),
                             border: InputBorder.none, // Remove the underline
                            hintText: 'email'),
                             validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email.';
                                      }
                                      return null;
                                            },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                          
                                           SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                               Container(height: 57,width:57,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/phone.png"))),),
                                              Container(
                                                height: 40,
                                                width: 291,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(25)),
                                                
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    controller: _phoneController,
                                                    decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical:11),
                             border: InputBorder.none, // Remove the underline
                            hintText: 'phone'),
                             validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your phone.';
                                      }
                                      return null;
                                            },
                                                  ),
                                                ),
                                              ),
                                           
                                            ],
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
                                                    obscureText: true,
                                                    controller: _passwordController,
                                                    decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical:11),
                             border: InputBorder.none, // Remove the underline
                            hintText: 'password'),
                             validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password.';
                                      }
                                      return null;
                                            },
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                                    obscureText: true,
                                                    controller: _confirmPasswordController,
                                                    decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical:11),
                             border: InputBorder.none, // Remove the underline
                            hintText: 'Confirm Password'),
                            validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please confirm your password.';
                                      } else if (value != _passwordController.text) {
                                        return 'Passwords do not match.';
                                      }
                                      return null;
                                            },
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
                                                  if (_emailController.text.isEmpty ||
                  _passwordController.text.isEmpty ||
                  _confirmPasswordController.text.isEmpty ||
                      _userNameController.text.isEmpty ||
                  _phoneController.text.isEmpty ||  _passwordController.text !=   _confirmPasswordController.text 
              ) {
                        Get.snackbar("Error","Fill all feilds");                 

                  }

                  else
                  {
                       UserCredential userCredential =
                                                  await _auth.createUserWithEmailAndPassword(
                                                email: _emailController.text,
                                                password: _passwordController.text,
                                              );

                                              _emailController.text = "" ;
                  _passwordController.text = "";
                  _confirmPasswordController.text = "";
                      _userNameController.text = "";
                  _phoneController.text = "";
                  Get.to(AuthScreen());
                              
                  }
                                             
                                             // await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).collection("games").add({});
                                             
                                          
                                      
                                    
                                              
                                              
                                            } catch (e) {
                                              print('Error signing in: $e');
                                            }
                                            },
                                            child: Text('Confirm'),
                                          ),
                                          SizedBox(height: 20,),
                              ],
                            ),
               
                
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("or",style: const TextStyle(  fontSize: 14.0,fontFamily: 'Open Sans',
                //                 fontWeight: FontWeight.w800,
                //                 color: Colors.white,)),
                //                   Text("Create An Account",style: const TextStyle(  fontSize: 14.0,fontFamily: 'Open Sans',
                //             fontWeight: FontWeight.w800,
                //             color: Color(0xFF6486FF))),
                //   ],
                // ),
                
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
        ),
      ),
    );
  }
}
