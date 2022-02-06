import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/get_started.dart';
import 'package:prototype/screens/authenticate/sign_in.dart';
import 'package:prototype/screens/authenticate/toggle.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'package:prototype/screens/maps/maps.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserAcc?>(context);

    print('this is the user stream = $user');

    if (user == null) {
      return Authenticate();
    }else{
      return Map();
    }
  }
}
