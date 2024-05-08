import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/language_screen.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/loginform.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9),
          image: DecorationImage(
            image: AssetImage("assets/images/home.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment(0, -0.7),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/foodeatupservice.png",
                      width: 124,
                      height: 59,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mode_night,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginForm()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Colors.grey[800],
                          ),
                          child: Text(
                            textAlign: TextAlign.left,
                            'Login',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                letterSpacing: 0.5,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'SUPER FACILE & RAPIDE',
                    style: TextStyle(
                      fontFamily: 'Garet',
                      fontSize: 96,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Menu Digitale",
                      style: TextStyle(
                        fontFamily: 'Garet',
                        fontSize: 96,
                        fontWeight: FontWeight.w800,
                        background: Paint()..color = Colors.transparent,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 100, top: 50),
                  child: Column(
                    children: [
                      Text(
                        "Pour Votre restaurant!",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Language()),
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          minimumSize: Size(212, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                          ),
                          side: BorderSide.none,
                          elevation: 0,
                        ),
                        child: Text(
                          "Démarrer",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
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
