import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'chat_screen.dart';
import 'request_marriage_screen.dart';
import 'vip_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendFlow'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 10),

          const Text(
            'Welcome to FriendFlow',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Connect • Match • Chat • Live',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          _homeButton(
            context,
            icon: Icons.person,
            title: 'My Profile',
            color: Colors.blue,
            screen: ProfileScreen(),
          ),

          _homeButton(
            context,
            icon: Icons.chat,
            title: 'Chat with Friends',
            color: Colors.green,
            screen: ChatScreen(),
          ),

          _homeButton(
            context,
            icon: Icons.favorite,
            title: 'Marriage & Matching',
            color: Colors.red,
            screen: const RequestMarriageScreen(),
          ),

          _homeButton(
            context,
            icon: Icons.workspace_premium,
            title: 'VIP Access',
            color: Colors.amber.shade800,
            screen: const VipScreen(),
          ),

          const SizedBox(height: 5),

          Card(
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.live_tv,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Live',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Live video, games and gifts coming soon',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'FriendFlow Live will be added next.',
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Card(
            color: Colors.pink.shade50,
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Find people. Build connections. Enjoy FriendFlow.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget screen,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
      ),
    );
  }
}
