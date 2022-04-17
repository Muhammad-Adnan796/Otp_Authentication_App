import 'package:ecommerce_app/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController nameC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final phone = "+92" + nameC.text;
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Enter Yor Phone Number",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 100,),

          TextFormField(

            controller: nameC,
            decoration: InputDecoration(
              prefixText: phone,
              prefixStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            if(nameC.text != null){
             phone;
              AuthProvider().loginwithPhone(context, nameC.text);
            }
          },child: Text("Login"),)
        ],
      ),
    );
  }
}
