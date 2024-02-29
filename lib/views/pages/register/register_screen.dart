import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/services/professional/professional_service.dart';
import 'package:menu_digitale_tablette/helpers/providers/professional_provider.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ProfessionalService _professionalService = ProfessionalService();


  void _register() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final result = await _professionalService.register(firstName, lastName, email, password);
    final ProfessionalProvider _provider = ProfessionalProvider();


    result.fold(
      (error) {
        // Handle registration failure
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed: $error')));
      },
      (data) {
        // Handle registration success
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful')));
        _provider.firstname=firstName;
        _provider.lastname=lastName;
        _provider.email=email;
        _provider.password=password;
        _provider.token=data['token'].toString();
        print(_provider.token);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
