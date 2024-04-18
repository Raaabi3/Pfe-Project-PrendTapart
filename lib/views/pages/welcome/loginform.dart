import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9), 
          image: DecorationImage(
            image: AssetImage("assets/images/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment(0, -0.7),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("/home/rabi3/Desktop/foodeatupservice.png",
                    width: 124,
                      height: 59,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.mode_night,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              BlurryContainer(
                blur: 5,
                elevation: 0,
                color: Colors.transparent,
                padding: const EdgeInsets.all(8),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                        Colors.black,
                        Colors.redAccent,
                        Colors.transparent
                      ]),
                      width: 2,
                    ),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Crée un compte",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Email',
                          ),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 24, 16, 16),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Password',
                            border: UnderlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 24, 16, 16),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'Connexion',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  'Mot de passe oublié',
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "En vous connectant, vous acceptez notre politique de confidentialité\n                                     et nos conditions d’utilisation.",
                          style: TextStyle(
                            height: 1.8,
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        
                        ),
                        
                      ],
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
