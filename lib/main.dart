import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './src/app.dart';

Future <void> main() async {
  //Initialise Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}