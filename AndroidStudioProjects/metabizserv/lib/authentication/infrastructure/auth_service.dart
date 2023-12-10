import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../domain/auth_failure.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else if (error == 'user-disabled') {
        return left(const AuthFailure.userDisabled());
      } else if (error == 'user-not-found' || error == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'too-many-requests') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<void> signOut() => _firebaseAuth.signOut();
}
