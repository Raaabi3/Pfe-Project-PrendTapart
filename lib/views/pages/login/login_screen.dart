import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/models/establishment_model/Establishment_model.dart';
import 'package:menu_digitale_tablette/views/pages/establishment/establishment_screen.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
final ProfessionalProvider _provider = Provider.of<ProfessionalProvider>(context);
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
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('action', 'Start');

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
                        
                        _provider.updateToken(data['token'].toString());
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EstablishmentsScreen()),
                    );
                      },
                    );

                    await prefs.setString('Token', _provider.token);

                  },
                  child: Text('Login'),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
