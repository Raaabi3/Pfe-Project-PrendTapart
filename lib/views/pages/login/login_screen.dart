import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/services/auth/auth_api.dart';
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
                    final snackBar = SnackBar(
                      content: AwesomeSnackbarContent(
                        title: 'Failed to login!',
                        message: "User dosn't exist",
                        contentType: ContentType.success,
                      ),
                    );
                    final result = await _provider.login(
                        emailController.text, passwordController.text);

                    result.fold(
                      (error) =>ScaffoldMessenger.of(context).showSnackBar(snackBar),
                      (data) {
                        _provider.token = data['token'].toString();
                        print(_provider.token);
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
