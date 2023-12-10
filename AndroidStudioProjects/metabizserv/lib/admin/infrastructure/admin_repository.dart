import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:dartz/dartz.dart';
import 'package:metabizserv/authentication/domain/admin.dart';
import 'package:metabizserv/authentication/domain/auth_failure.dart';

class AdminRepository {
  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;

  AdminRepository(this._firestore, this._functions);
  DocumentSnapshot? _lastAdminDoc;
  DocumentSnapshot? get lastAdminDoc => _lastAdminDoc;
  static const adminsCollection = 'Admins';
  static const createAdminFunction = 'createAdmin';

  Future<Admin?> fetchAdmin(String adminId) async {
    final adminDocSnapshot =
        await _firestore.collection(adminsCollection).doc(adminId).get();
    if (!adminDocSnapshot.exists) {
      return null;
    }
    return Admin.fromJson(adminDocSnapshot.data()!);
  }

  Future<void> deleteAdmin(String adminId) async {
    return _firestore.collection(adminsCollection).doc(adminId).delete();
  }

  Future<List<Admin>> fetchAdmins(
      {DocumentSnapshot? startAfterDoc, int? pageSize}) async {
    final adminsQuerySnapshot = startAfterDoc != null && pageSize != null
        ? await _firestore
            .collection(adminsCollection)
            .startAfterDocument(startAfterDoc)
            .limit(pageSize)
            .get()
        : await _firestore.collection(adminsCollection).get();
    _lastAdminDoc = adminsQuerySnapshot.docs.last;
    return adminsQuerySnapshot.docs
        .map((e) => Admin.fromJson(e.data()))
        .toList();
  }

  Future<Either<AuthFailure, Unit>> createAdmin({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final createAdminCallable = _functions.httpsCallable(createAdminFunction,
        options: HttpsCallableOptions(timeout: const Duration(seconds: 6)));

    try {
      final result = await createAdminCallable.call({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      });
      print(result);
      return right(unit);
    } on FirebaseFunctionsException catch (error) {
      final code = error.code;
      if (code == 'unavailable') {
        return left(const AuthFailure.emailInUse());
      }
      rethrow;
    }
  }
}
