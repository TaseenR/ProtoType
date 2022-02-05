import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Text('Log In!'),
          IconButton(
              icon: Icon(
                Icons.call,
                size: 20.0,
                color: Colors.brown[900],
              ),
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Map()))),
        ],
      ),
    );
  }
}
