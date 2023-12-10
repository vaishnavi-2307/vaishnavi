import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:metabizserv/admin/infrastructure/admin_repository.dart';
import 'package:metabizserv/authentication/application/auth/auth_cubit.dart';
import 'package:metabizserv/authentication/infrastructure/auth_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register third-party packages
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  sl.registerLazySingleton<FirebaseFunctions>(() => FirebaseFunctions.instance);

  // Register Services
  sl.registerLazySingleton<AuthService>(() => AuthService(sl()));
  sl.registerLazySingleton<AdminRepository>(() => AdminRepository(sl(), sl()));

  // Register cubit
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl(), sl()));
}
