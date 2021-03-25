import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BaseUser {
  BaseUser({@required this.uid});
  final String uid;

  @override
  String toString() {
    return uid;
  }
}

abstract class AuthBase {
  Stream<BaseUser> get onAuthStateChanges;

  Future<BaseUser> currentUser();

  Future<BaseUser> signInAnonymously();

  Future<BaseUser> signInWithEmailAndPassword(String email, String password);

  Future<BaseUser> createUserWithEmailAndPassword(String email, String password);

  Future<void> signOut();

  void passwordReset(String email);

}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  BaseUser _userFromFirebase(User user) {
    if (user != null) {
      return BaseUser(uid: user.uid);
    }
    return null;
  }

  @override
  Stream<BaseUser> get onAuthStateChanges {
    return  _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }


  @override
  Future<BaseUser> currentUser() async {
    final currentUser = _firebaseAuth.currentUser;
    return _userFromFirebase(currentUser);
  }

  @override
  Future<BaseUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<BaseUser> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<BaseUser> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  void passwordReset(String email){
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
