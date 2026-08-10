import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  File? _image;

  Future<void> _pickImage() async {

    final pickedFile =
        await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );

    if (pickedFile != null) {

      setState(() {
        _image = File(pickedFile.path);
      });

    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            GestureDetector(

              onTap: _pickImage,

              child: CircleAvatar(

                radius: 60,

                backgroundImage:
                    _image != null
                    ? FileImage(_image!)
                    : null,

                child: _image == null
                    ? const Icon(
                        Icons.person,
                        size: 70,
                      )
                    : null,
              ),
            ),


            const SizedBox(height: 15),


            const Text(
              'FriendFlow User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 5),


            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: const [

                Icon(
                  Icons.verified,
                  color: Colors.blue,
                ),

                SizedBox(width: 5),

                Text(
                  'Verified User',
                ),
              ],
            ),


            const SizedBox(height: 20),


            Card(

              child: Padding(

                padding:
                    const EdgeInsets.all(15),

                child: Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,

                  children: const [

                    _ProfileStat(
                      title: 'Followers',
                      value: '0',
                    ),

                    _ProfileStat(
                      title: 'Following',
                      value: '0',
                    ),

                    _ProfileStat(
                      title: 'Posts',
                      value: '0',
                    ),

                  ],
                ),
              ),
            ),


            const SizedBox(height: 20),


            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'Location',
              ),
              subtitle: Text(
                'Add your location',
              ),
            ),


            const ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About Me',
              ),
              subtitle: Text(
                'Tell people about yourself',
              ),
            ),


            const SizedBox(height: 20),


            ElevatedButton.icon(

              onPressed: _pickImage,

              icon: const Icon(
                Icons.photo,
              ),

              label: const Text(
                'Change Profile Photo',
              ),
            ),


          ],
        ),
      ),
    );
  }
}



class _ProfileStat extends StatelessWidget {

  final String title;
  final String value;


  const _ProfileStat({

    required this.title,
    required this.value,

  });


  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Text(

          value,

          style: const TextStyle(

            fontSize: 20,

            fontWeight:
                FontWeight.bold,

          ),
        ),


        Text(title),

      ],
    );
  }
}
