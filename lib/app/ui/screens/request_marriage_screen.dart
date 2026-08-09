import 'package:flutter/material.dart';

class RequestMarriageScreen extends StatefulWidget {
  const RequestMarriageScreen({Key? key}) : super(key: key);

  @override
  State<RequestMarriageScreen> createState() =>
      _RequestMarriageScreenState();
}

class _RequestMarriageScreenState
    extends State<RequestMarriageScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _ageController =
      TextEditingController();

  final TextEditingController _locationController =
      TextEditingController();

  final TextEditingController _descriptionController =
      TextEditingController();

  String? _maritalStatus;
  String _plan = 'basic';

  final List<String> _statusOptions = [
    'Single',
    'Divorced',
    'Widowed',
  ];

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Marriage profile submitted successfully.',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marriage Match'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Icon(
              Icons.favorite,
              size: 70,
              color: Colors.red,
            ),

            const SizedBox(height: 15),

            const Text(
              'Find Your Marriage Partner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Create your marriage profile and discover suitable matches.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 25),

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake),
              ),
              validator: (value) {
                final age = int.tryParse(value ?? '');

                if (age == null) {
                  return 'Please enter your age';
                }

                if (age < 18) {
                  return 'Marriage matching is for adults 18+';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: _maritalStatus,
              decoration: const InputDecoration(
                labelText: 'Marital Status',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.favorite_border),
              ),
              items: _statusOptions.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _maritalStatus = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select your marital status';
                }
                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'About Yourself',
                hintText: 'Tell others about yourself...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Choose a plan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Basic - \$3'),
              value: 'basic',
              groupValue: _plan,
              onChanged: (value) {
                setState(() {
                  _plan = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Standard - \$5'),
              value: 'standard',
              groupValue: _plan,
              onChanged: (value) {
                setState(() {
                  _plan = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Premium - \$10'),
              value: 'premium',
              groupValue: _plan,
              onChanged: (value) {
                setState(() {
                  _plan = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Premium + Video - \$15'),
              value: 'video',
              groupValue: _plan,
              onChanged: (value) {
                setState(() {
                  _plan = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _submitRequest,
                icon: const Icon(Icons.favorite),
                label: const Text(
                  'Submit Marriage Profile',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
