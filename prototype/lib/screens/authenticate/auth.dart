import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prototype/screens/authenticate/database.dart';



class UserAcc{

  final String? uid;

  UserAcc({ this.uid});

}


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get uid => null;

  //create a user obj based on the firebase user
  UserAcc? _userFromFirebase(User? user){
    return user != null ? UserAcc(uid: user.uid) : null;
  }

  Stream<UserAcc?> get user{
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future CreateAccount(String email, String password,String name,String Surname,String age) async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = credential.user;

      await DatabaseService(uid: credential.user!.uid).updateUserData(name,Surname, age );//setting up the users data in database and initalizing it
      return _userFromFirebase(firebaseUser);
    }catch(e){
      print(e.toString());
      return null;
    }
}

  Future LogInWithEmail(String email, String password) async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
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