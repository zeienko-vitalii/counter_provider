import 'package:counter_provider/presentation/screens/app/counter_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await _init();
  runApp(const CounterApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
