import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/professional_provider.dart';
import 'package:menu_digitale_tablette/services/professional/professional_service.dart';
import 'package:menu_digitale_tablette/views/pages/register/register_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ProfessionalProvider _provider = ProfessionalProvider();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final professionalService = ProfessionalService();
                    final result = await professionalService.login(
                      emailController.text,
                      passwordController.text,
                    );

                    result.fold(
                      (error) => print('Error: $error'),
                      (data) {
                        _provider.email=emailController.text;
                        _provider.password=passwordController.text;
                        _provider.token=data['token'].toString();
                      },
                    );
                  },
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                    // Navigate to the register page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()),
                    );
                  },
                  child: Text('Go to Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
