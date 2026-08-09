import 'package:flutter/material.dart';
import 'app/ui/screens/signup_screen.dart';

void main() {
  runApp(const FriendFlowApp());
}

class FriendFlowApp extends StatelessWidget {
  const FriendFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FriendFlow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignupScreen(),
    );
  }
}
