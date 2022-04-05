import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/Authentication/user.dart';

class Authentication{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

 
   //create user object based on firebase user
  Useru? _userFromFirebaseUser(User? user) {
    return user != null ? Useru(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Useru?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signUp({ email, password}) async{
    try{
     var result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((result){
         User? user= result.user;
      // await AddDetails(uid: user!.uid,);
      return _userFromFirebaseUser(user);
     }).catchError((err){
       if (err.code == 'user-not-found') {
          SnackBar(
            content: Text("No user found for that email."),
            duration: Duration(seconds: 7),
          );
     }});
    
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
   Future signIn({required String email,required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((result){
          User? user= result.user;
      return _userFromFirebaseUser(user);
     }).catchError((err){
       if (err.code == 'user-not-found') {
          SnackBar(
            content: Text("No user found for that email."),
            duration: Duration(seconds: 7),
          );
     }});
  
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future SignOut() async{
    try{
      
      return await _firebaseAuth.signOut();;
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}