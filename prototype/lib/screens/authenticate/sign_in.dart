import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/auth.dart';
import 'package:prototype/screens/authenticate/register.dart';
import 'package:prototype/screens/maps/maps.dart';

class SignIn extends StatefulWidget {


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (val) => val!.isEmpty ? 'enter an email' : null,
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val!.length < 6 ? 'enter an password' : null,
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      dynamic logInAttempt = await _auth.LogInWithEmail(email, password);
                      print(logInAttempt);
                      if (logInAttempt == null){
                        setState(() {
                          error = 'Not a valid email/password';
                        });
                      }else{
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => Map()));
                      }
                    }
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
                    Text(
                   'Register here!'),
                      SizedBox(height: 20),
                      Text('$error',style: TextStyle(color: Colors.red),),
                  ]
              )
    )

            ],
          ),
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
