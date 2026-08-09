import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _maritalStatus = 'Single';
  bool _showPassword = false;

  final List<String> _statusOptions = [
    'Single',
    'Married',
    'Divorced',
  ];

  void _createAccount() {
    if (_formKey.currentState!.validate()) {

      // وروسته به دلته Firebase/Database وصل کړو

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [

              const SizedBox(height: 20),

              const Icon(
                Icons.people_alt,
                size: 80,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _emailController,

                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),

                keyboardType: TextInputType.emailAddress,

                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _passwordController,

                obscureText: !_showPassword,

                decoration: InputDecoration(
                  labelText: 'Password',

                  border: const OutlineInputBorder(),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),

                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(

                value: _maritalStatus,

                decoration: const InputDecoration(
                  labelText: 'Marital Status',
                  border: OutlineInputBorder(),
                ),

                items: _statusOptions.map((status) {

                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );

                }).toList(),

                onChanged: (value) {

                  setState(() {
                    _maritalStatus = value!;
                  });

                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(

                onPressed: _createAccount,

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),

                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 18),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
