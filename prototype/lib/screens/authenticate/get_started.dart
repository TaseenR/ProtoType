import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/sign_in.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          //We take the image from the assets
          Image.asset('assets/prototype.png',height: 250,),
      SizedBox(
        height: 20,
      ),
      //Texts and Styling of them
      Text(
        'Welcome to KhanMaine Proto!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
      SizedBox(height: 20),
            MaterialButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignIn())),
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
                  Icon(Icons.arrow_forward_ios)
                ],),)
      ]
    )
    );}
  }


