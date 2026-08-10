import 'package:flutter/material.dart';
import 'gift_store_screen.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  void _openGiftStore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GiftStoreScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Now 🔴'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Popular Live Rooms',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          LiveCard(
            name: 'Sarah Live',
            viewers: '2.5K viewers',
            color: Colors.pink,
            onGift: () => _openGiftStore(context),
          ),

          LiveCard(
            name: 'Ahmad Gaming',
            viewers: '1.8K viewers',
            color: Colors.blue,
            onGift: () => _openGiftStore(context),
          ),

          LiveCard(
            name: 'FriendFlow Talk',
            viewers: '950 viewers',
            color: Colors.green,
            onGift: () => _openGiftStore(context),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
            label: const Text('Start Live'),
          ),
        ],
      ),
    );
  }
}

class LiveCard extends StatelessWidget {
  final String name;
  final String viewers;
  final Color color;
  final VoidCallback onGift;

  const LiveCard({
    Key? key,
    required this.name,
    required this.viewers,
    required this.color,
    required this.onGift,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: color,
            child: const Center(
              child: Icon(
                Icons.live_tv,
                size: 70,
                color: Colors.white,
              ),
            ),
          ),

          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(viewers),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Join'),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),

              IconButton(
                onPressed: onGift,
                icon: const Icon(
                  Icons.card_giftcard,
                  color: Colors.amber,
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
