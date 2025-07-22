import 'package:flutter/material.dart';

class RequestMarriageScreen extends StatefulWidget {
  const RequestMarriageScreen({Key? key}) : super(key: key);

  @override
  State<RequestMarriageScreen> createState() => _RequestMarriageScreenState();
}

class _RequestMarriageScreenState extends State<RequestMarriageScreen> {
  String? maritalStatus;
  String? plan = 'basic';
  final _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request for Marriage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              DropdownButtonFormField<String>(
                value: maritalStatus,
                hint: const Text("Marital Status"),
                onChanged: (value) => setState(() => maritalStatus = value),
                items: [
                  'Single',
                  'Divorced',
                  'Widowed',
                ]
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Description about yourself'),
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              const Text('Select Plan:'),
              RadioListTile(
                title: const Text('Basic - \$3'),
                value: 'basic',
                groupValue: plan,
                onChanged: (value) => setState(() => plan = value as String),
              ),
              RadioListTile(
                title: const Text('Standard - \$5'),
                value: 'standard',
                groupValue: plan,
                onChanged: (value) => setState(() => plan = value as String),
              ),
              RadioListTile(
                title: const Text('Premium - \$10'),
                value: 'premium',
                groupValue: plan,
                onChanged: (value) => setState(() => plan = value as String),
              ),
              RadioListTile(
                title: const Text('Premium with video - \$15'),
                value: 'video',
                groupValue: plan,
                onChanged: (value) => setState(() => plan = value as String),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save to backend or local DB
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Marriage request submitted!'),
                      ),
                    );
                  }
                },
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
