import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/register.dart';
import 'package:prototype/screens/maps/maps.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        title: Text('Log in!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20,),)
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (val){

              },
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (val){

              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){

                },
                child: Text('Log In!'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black45
                ),
            ),
            SizedBox(height: 75),
            TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Register()));
            },
                child: Column(
                    children: <Widget>[
                      Text('Not a member?'),
              Text( 'Register here!'),
                ]
            )
    )

          ],
        ),
      ),
    );
  }
}




/*IconButton(
icon: Icon(
Icons.call,
size: 20.0,
color: Colors.brown[900],
),
onPressed: () => Navigator.pushReplacement(
context, MaterialPageRoute(builder: (_) => Map()))),*/
