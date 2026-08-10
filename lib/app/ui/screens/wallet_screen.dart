import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'My Wallet 💎',
        ),
        centerTitle: true,
      ),


      body: ListView(

        padding:
            const EdgeInsets.all(16),


        children: [

          Card(

            elevation: 4,

            child: Padding(

              padding:
                  const EdgeInsets.all(20),

              child: Column(

                children: [

                  const Icon(
                    Icons.diamond,
                    size: 70,
                    color: Colors.blue,
                  ),


                  const SizedBox(height: 10),


                  const Text(
                    'Current Balance',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),


                  const SizedBox(height: 5),


                  const Text(
                    '1,000 Coins 💎',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),


          const SizedBox(height: 20),


          const Text(
            'Buy Coins',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 10),


          _coinPackage(
            '100 Coins',
            '\$1',
          ),


          _coinPackage(
            '500 Coins',
            '\$5',
          ),


          _coinPackage(
            '1000 Coins',
            '\$10',
          ),


          const SizedBox(height: 20),


          const Text(
            'Transaction History',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),


          const ListTile(

            leading:
                Icon(
                  Icons.card_giftcard,
                ),

            title:
                Text(
                  'Sent Rose Gift',
                ),

            subtitle:
                Text(
                  '-10 Coins',
                ),
          ),


          const ListTile(

            leading:
                Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),

            title:
                Text(
                  'Coins Purchased',
                ),

            subtitle:
                Text(
                  '+1000 Coins',
                ),
          ),

        ],
      ),
    );
  }



  Widget _coinPackage(
    String coins,
    String price,
  ) {

    return Card(

      child: ListTile(

        leading:
            const Icon(
              Icons.diamond,
              color: Colors.blue,
            ),


        title:
            Text(
              coins,
              style:
                  const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),


        subtitle:
            Text(price),


        trailing:
            ElevatedButton(

          onPressed: () {},

          child:
              const Text(
                'Buy',
              ),

        ),

      ),
    );
  }
}
