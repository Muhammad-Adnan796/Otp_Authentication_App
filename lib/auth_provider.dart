import 'package:ecommerce_app/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  Future<bool> loginwithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpController = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User? user = result.user;
          if (user != null) {
            Navigator.pushReplacementNamed(context, HomePage.id);
          } else {
            Fluttertoast.showToast(msg: "User is not Signed in");
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationcode, int? token) async {
          showDialog(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AlertDialog(
                        title: Text("Enter OTP"),
                        content: Column(
                          children: [
                            Container(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Container(
                                  child: TextFormField(
                                    decoration:
                                    InputDecoration(border: InputBorder.none),
                                    controller: otpController,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  width: 40,
                                ),
                                Container(
                                  child: TextFormField(
                                    decoration:
                                    InputDecoration(border: InputBorder.none),
                                    controller: otpController,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  width: 40,
                                ),
                                Container(
                                  child: TextFormField(
                                    decoration:
                                    InputDecoration(border: InputBorder.none),
                                    controller: otpController,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  width: 40,
                                ),
                                Container(
                                  child: TextFormField(
                                    decoration:
                                    InputDecoration(border: InputBorder.none),
                                    controller: otpController,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  width: 40,
                                ),
                                Container(
                                  child: TextFormField(
                                    decoration:
                                    InputDecoration(border: InputBorder.none),
                                    controller: otpController,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  width: 40,
                                ),
                                Container(
                                  child: TextFormField(
                                    decoration:
                                    InputDecoration(border: InputBorder.none),
                                    controller: otpController,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 50,
                                  width: 40,
                                )
                              ],),
                            ),

                          ],
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () async {
                                final code = otpController.text;
                                AuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationcode,
                                        smsCode: code);
                                UserCredential result = await _auth
                                    .signInWithCredential(credential);
                                User? user = result.user;
                                if (user != null) {
                                  Navigator.pushReplacementNamed(
                                      context, HomePage.id);
                                  Fluttertoast.showToast(
                                      msg: "Success", textColor: Colors.white);
                                } else {
                                  Fluttertoast.showToast(msg: "Error");
                                }
                              },
                              child: Text("Verify"))
                        ]),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});

    return true;
  }
}
