import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class UserAcc{

  final String? uid;

  UserAcc({ this.uid});

}


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user obj based on the firebase user
  UserAcc? _userFromFirebase(User? user){
    return user != null ? UserAcc(uid: user.uid) : null;
  }


  Future CreateAccount(String email, String password) async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = credential.user;
      return _userFromFirebase(firebaseUser);
    }catch(e){
      print(e.toString());
      return null;
    }
}







  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }




}