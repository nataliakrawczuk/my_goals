
import 'package:flutter/material.dart';

import '../../features/pages/auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AuthGate(),
    
    );
    
  }
}