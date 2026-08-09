import 'package:flutter/material.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendFlow VIP'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.workspace_premium,
            size: 80,
            color: Colors.amber,
          ),

          const SizedBox(height: 15),

          const Text(
            'Upgrade to FriendFlow VIP',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Get more visibility and enjoy special FriendFlow features.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 30),

          _buildPlan(
            context,
            title: 'VIP Basic',
            price: '\$3',
            description: 'Basic profile boost and VIP badge.',
          ),

          _buildPlan(
            context,
            title: 'VIP Plus',
            price: '\$7',
            description: 'More profile exposure and additional VIP features.',
          ),

          _buildPlan(
            context,
            title: 'VIP Premium',
            price: '\$15',
            description: 'Maximum profile exposure and premium features.',
          ),
        ],
      ),
    );
  }

  Widget _buildPlan(
    BuildContext context, {
    required String title,
    required String price,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 15),

            Text(
              price,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title selected. Payment will be added later.'),
                    ),
                  );
                },
                child: const Text('Choose Plan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
