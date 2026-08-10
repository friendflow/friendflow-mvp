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
            size: 90,
            color: Colors.amber,
          ),


          const SizedBox(height: 15),


          const Text(
            'Upgrade to VIP 👑',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 10),


          const Text(
            'Unlock premium features and grow your FriendFlow experience.',
            textAlign: TextAlign.center,
          ),


          const SizedBox(height: 25),


          const Card(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [

                  Text(
                    'VIP Benefits',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text('✓ VIP Badge'),

                  Text('✓ Profile Boost'),

                  Text('✓ More Matching Visibility'),

                  Text('✓ Priority Live Features'),

                ],
              ),
            ),
          ),


          const SizedBox(height: 20),


          _planCard(
            'VIP Basic',
            '\$3',
            'VIP badge and profile boost',
          ),


          _planCard(
            'VIP Plus',
            '\$7',
            'More visibility and extra features',
          ),


          _planCard(
            'VIP Premium',
            '\$15',
            'Maximum FriendFlow experience',
          ),

        ],
      ),
    );
  }



  Widget _planCard(
    String title,
    String price,
    String description,
  ) {

    return Card(

      elevation: 4,

      margin:
          const EdgeInsets.only(bottom: 15),


      child: Padding(

        padding:
            const EdgeInsets.all(18),


        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,


          children: [

            Text(
              title,
              style:
                  const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
            ),


            const SizedBox(height: 8),


            Text(description),


            const SizedBox(height: 10),


            Text(
              price,
              style:
                  const TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),


            const SizedBox(height: 10),


            SizedBox(

              width:
                  double.infinity,

              child:
                  ElevatedButton(

                onPressed: () {},

                child:
                    const Text(
                      'Choose Plan',
                    ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
