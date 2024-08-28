// widget
import 'package:app/screens/profile/login_screen.dart';
import 'package:flutter/material.dart';

var afficheText = const Text(
  "Hello World",
  style: TextStyle(
    fontSize: 30,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    
  ),
);

var afficheIcon = const Icon(
  Icons.email,
  color: Colors.grey,
  size: 25,
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
