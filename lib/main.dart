import 'package:firebase_core/firebase_core.dart';
import 'package:fixit_admin/environment.dart';
import 'package:fixit_admin/firebase_options.dart';
import 'package:fixit_admin/injector.dart';
import 'package:fixit_admin/root_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.init(
    apiBaseUrl: 'https://example.com',
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await serviceLocator();

  runApp(const RootApp());
}
