import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class baseUser {
  baseUser({@required this.uid});
  final String uid;

  @override
  String toString() {
    return '${uid}';
  }
}

abstract class AuthBase {
  Stream<baseUser> get onAuthStateChanges;

  Future<baseUser> currentUser();

  Future<baseUser> signInAnonymously();

  Future<baseUser> signInWithEmailAndPassword(String email, String password);

  Future<baseUser> createUserWithEmailAndPassword(String email, String password);

  Future<void> signOut();

}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  baseUser _userFromFirebase(User user) {
    if (user != null) {
      return baseUser(uid: user.uid);
    }
    return null;
  }

  @override
  Stream<baseUser> get onAuthStateChanges {
    return  _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }


  @override
  Future<baseUser> currentUser() async {
    final currentUser = await _firebaseAuth.currentUser;
    return _userFromFirebase(currentUser);
  }

  @override
  Future<baseUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<baseUser> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<baseUser> createUserWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
