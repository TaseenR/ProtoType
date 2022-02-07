import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String lastName, String age) async {
    return await userCollection.doc(uid).set({
       'Firstname': name,
      'Surname' : lastName,
      'Age' : age
    });
  }


  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }


}