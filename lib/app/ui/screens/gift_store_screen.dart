import 'package:flutter/material.dart';

class GiftStoreScreen extends StatelessWidget {
  const GiftStoreScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Gift Store 🎁',
        ),
        centerTitle: true,
      ),


      body: ListView(

        padding:
            const EdgeInsets.all(16),


        children: [

          const Card(

            child: Padding(

              padding:
                  EdgeInsets.all(18),

              child: Column(

                children: [

                  Icon(
                    Icons.diamond,
                    size: 60,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Your Coins: 1000 💎',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),


          const SizedBox(height: 20),


          _giftCard(
            icon: Icons.local_florist,
            name: 'Rose',
            coins: '10 Coins',
            color: Colors.pink,
          ),


          _giftCard(
            icon: Icons.favorite,
            name: 'Heart',
            coins: '50 Coins',
            color: Colors.red,
          ),


          _giftCard(
            icon: Icons.diamond,
            name: 'Diamond',
            coins: '100 Coins',
            color: Colors.blue,
          ),


          _giftCard(
            icon: Icons.workspace_premium,
            name: 'Crown',
            coins: '500 Coins',
            color: Colors.amber,
          ),

        ],
      ),
    );
  }



  Widget _giftCard({

    required IconData icon,

    required String name,

    required String coins,

    required Color color,

  }) {


    return Card(

      elevation: 3,

      margin:
          const EdgeInsets.only(
            bottom: 15,
          ),


      child: ListTile(

        leading:
            CircleAvatar(

          backgroundColor:
              color,

          child:
              Icon(
                icon,
                color:
                    Colors.white,
              ),

        ),


        title:
            Text(
              name,
              style:
                  const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),


        subtitle:
            Text(coins),


        trailing:
            ElevatedButton(

          onPressed: () {},

          child:
              const Text(
                'Send',
              ),

        ),

      ),
    );
  }
}
