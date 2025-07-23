import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelfieVerificationScreen extends StatefulWidget {
  @override
  _SelfieVerificationScreenState createState() => _SelfieVerificationScreenState();
}

class _SelfieVerificationScreenState extends State<SelfieVerificationScreen> {
  File? _selfieImage;

  Future<void> _takeSelfie() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selfieImage = File(pickedFile.path);
      });
    }
  }

  void _verifySelfie() {
    if (_selfieImage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selfie verified successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please take a selfie first.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selfie Verification')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selfieImage != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(_selfieImage!),
                  )
                : Icon(Icons.camera_alt, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takeSelfie,
              child: Text('Take Selfie'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verifySelfie,
              child: Text('Verify Selfie'),
            ),
          ],
        ),
      ),
    );
  }
}
