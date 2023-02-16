
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_goals/features/pages/auth_gate.dart';
import 'app/home/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}




