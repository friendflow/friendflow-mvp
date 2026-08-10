import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'profile_screen.dart';
import 'request_marriage_screen.dart';
import 'vip_screen.dart';
import 'selfie_verification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    _HomeFeed(),
    ChatScreen(),
    _LiveScreen(),
    _MarriageScreen(),
    ProfileScreen(),
  ];

  void _openVip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VipScreen(),
      ),
    );
  }

  void _openVerification() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelfieVerificationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FriendFlow',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'VIP',
            onPressed: _openVip,
            icon: const Icon(
              Icons.workspace_premium,
              color: Colors.amber,
            ),
          ),
          IconButton(
            tooltip: 'Verification',
            onPressed: _openVerification,
            icon: const Icon(Icons.verified_user),
          ),
        ],
      ),

      body: _pages[_currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.live_tv_outlined),
            selectedIcon: Icon(Icons.live_tv),
            label: 'Live',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Marriage',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// ======================================================
// HOME FEED
// ======================================================

class _HomeFeed extends StatelessWidget {
  const _HomeFeed();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [

        const Text(
          'Welcome to FriendFlow 👋',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Connect, chat, discover people and enjoy your community.',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 20),

        // Stories
        SizedBox(
          height: 105,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _Story(
                name: 'Your Story',
                icon: Icons.add_a_photo,
                color: Colors.blue,
              ),
              _Story(
                name: 'Sarah',
                icon: Icons.person,
                color: Colors.pink,
              ),
              _Story(
                name: 'Ahmad',
                icon: Icons.person,
                color: Colors.green,
              ),
              _Story(
                name: 'Maryam',
                icon: Icons.person,
                color: Colors.orange,
              ),
              _Story(
                name: 'David',
                icon: Icons.person,
                color: Colors.purple,
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        // Post 1
        const _PostCard(
          name: 'FriendFlow Community',
          text:
              'Welcome to FriendFlow! Connect with people, make friends and enjoy the community.',
          likes: 125,
          comments: 18,
        ),

        const SizedBox(height: 15),

        // Post 2
        const _PostCard(
          name: 'FriendFlow Live',
          text:
              'People are going live now. Join the conversation and have fun!',
          likes: 243,
          comments: 36,
        ),

        const SizedBox(height: 20),

        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const Icon(
                  Icons.workspace_premium,
                  size: 45,
                  color: Colors.amber,
                ),
                const SizedBox(height: 10),
                const Text(
                  'FriendFlow VIP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Get extra features, better visibility and VIP content.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VipScreen(),
                      ),
                    );
                  },
                  child: const Text('View VIP'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// ======================================================
// STORY
// ======================================================

class _Story extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const _Story({
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 31,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}


// ======================================================
// POST
// ======================================================

class _PostCard extends StatelessWidget {
  final String name;
  final String text;
  final int likes;
  final int comments;

  const _PostCard({
    required this.name,
    required this.text,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

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
            subtitle: const Text('FriendFlow'),
            trailing: const Icon(Icons.more_vert),
          ),

          Container(
            height: 180,
            width: double.infinity,
            color: Colors.blue.shade100,
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 70,
                color: Colors.blue,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              Text('$likes'),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.comment_outlined),
              ),
              Text('$comments'),

              const Spacer(),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// ======================================================
// LIVE SCREEN
// ======================================================

class _LiveScreen extends StatelessWidget {
  const _LiveScreen();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [

        const Text(
          'Live Now 🔴',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        _LiveCard(
          name: 'Live Creator 1',
          viewers: '1.2K viewers',
          color: Colors.red.shade300,
        ),

        _LiveCard(
          name: 'Live Creator 2',
          viewers: '856 viewers',
          color: Colors.purple.shade300,
        ),

        _LiveCard(
          name: 'Live Creator 3',
          viewers: '432 viewers',
          color: Colors.orange.shade300,
        ),

        const SizedBox(height: 15),

        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.videocam),
          label: const Text('Start Live'),
        ),
      ],
    );
  }
}


class _LiveCard extends StatelessWidget {
  final String name;
  final String viewers;
  final Color color;

  const _LiveCard({
    required this.name,
    required this.viewers,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [

          Container(
            height: 170,
            width: double.infinity,
            color: color,
            child: const Center(
              child: Icon(
                Icons.live_tv,
                size: 65,
                color: Colors.white,
              ),
            ),
          ),

          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(name),
            subtitle: Text(viewers),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Join'),
            ),
          ),
        ],
      ),
    );
  }
}


// ======================================================
// MARRIAGE SCREEN
// ======================================================

class _MarriageScreen extends StatelessWidget {
  const _MarriageScreen();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [

        const Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 65,
        ),

        const SizedBox(height: 10),

        const Text(
          'Marriage & Matching',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Find people who are looking for a serious relationship or marriage.',
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 25),

        Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.pink,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: const Text('Available Profiles'),
            subtitle: const Text(
              'Discover people based on your preferences.',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),

        const SizedBox(height: 12),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.favorite_border,
              color: Colors.pink,
              size: 35,
            ),
            title: const Text('Request Marriage'),
            subtitle: const Text(
              'Create your marriage profile.',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RequestMarriageScreen(),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            children: [
              Icon(
                Icons.verified_user,
                color: Colors.pink,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                'Safety First',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Verification and safety features will help create a trusted community.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
