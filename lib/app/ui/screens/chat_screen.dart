import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Messages',
        ),
      ),


      body: Column(

        children: [

          Expanded(

            child: ListView(

              padding:
                  const EdgeInsets.all(12),

              children: const [

                _ChatUser(
                  name: 'Sarah',
                  message: 'Hello, how are you?',
                  online: true,
                ),


                _ChatUser(
                  name: 'Ahmad',
                  message: 'Welcome to FriendFlow',
                  online: true,
                ),


                _ChatUser(
                  name: 'Maryam',
                  message: 'Nice to meet you',
                  online: false,
                ),


                _ChatUser(
                  name: 'David',
                  message: 'Let us chat',
                  online: false,
                ),

              ],
            ),
          ),


          Container(

            padding:
                const EdgeInsets.all(10),

            child: Row(

              children: [

                Expanded(

                  child: TextField(

                    decoration:
                        InputDecoration(

                      hintText:
                          'Write a message...',

                      border:
                          OutlineInputBorder(

                        borderRadius:
                            BorderRadius.circular(25),

                      ),
                    ),
                  ),
                ),


                const SizedBox(width: 8),


                CircleAvatar(

                  child:
                      IconButton(

                    icon:
                        const Icon(Icons.send),

                    onPressed: () {},

                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}



class _ChatUser extends StatelessWidget {

  final String name;
  final String message;
  final bool online;


  const _ChatUser({

    required this.name,
    required this.message,
    required this.online,

  });


  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: Stack(

          children: [

            const CircleAvatar(

              child:
                  Icon(Icons.person),

            ),


            if (online)

              Positioned(

                right: 0,

                bottom: 0,

                child: Container(

                  width: 12,

                  height: 12,

                  decoration:
                      const BoxDecoration(

                    color: Colors.green,

                    shape:
                        BoxShape.circle,

                  ),
                ),
              ),

          ],
        ),


        title: Text(

          name,

          style:
              const TextStyle(

            fontWeight:
                FontWeight.bold,

          ),
        ),


        subtitle:
            Text(message),


        trailing:
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),

      ),
    );
  }
}
