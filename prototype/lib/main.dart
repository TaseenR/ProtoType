import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/auth.dart';
import 'package:prototype/screens/authenticate/get_started.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prototype/screens/authenticate/wrapper.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAcc?>.value(value: AuthService().user, initialData: null,
    child: MaterialApp(home: GetStarted()));
    ;
  }


}