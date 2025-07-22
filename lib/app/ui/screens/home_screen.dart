import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendFlow Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to profile screen
              },
              child: const Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to marriage request screen
              },
              child: const Text('Marriage Request'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to VIP access screen
              },
              child: const Text('VIP Access'),
            ),
          ],
        ),
      ),
    );
  }
}
