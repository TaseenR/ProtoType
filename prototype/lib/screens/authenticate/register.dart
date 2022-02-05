import 'dart:ui';
import 'package:prototype/screens/authenticate/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/sign_in.dart';
import 'package:prototype/screens/maps/maps.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        title: Text('Sign Up!',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20,),)
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
                validator: (val) => val!.length < 6 ? 'enter an password with more then 6 characters' : null,
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: (
                      ){
                    if(_formKey.currentState!.validate()){
                      _auth.CreateAccount(email, password);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Map()));
                    }
                  },
                  child: Text('Sign Up!'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45
                  ),
              ),
              SizedBox(height: 75),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignIn()));
              },
                  child: Column(
                      children: <Widget>[
                        Text('Already a user?'),
                Text( 'Log in here!'),
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
