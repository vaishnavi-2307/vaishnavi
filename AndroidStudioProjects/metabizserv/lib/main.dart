import 'package:flutter/material.dart';
import 'package:metabizserv/core/presentation/app_widget.dart';
import 'package:metabizserv/core/shared/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:metabizserv/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
}
