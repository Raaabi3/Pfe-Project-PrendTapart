import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/views/pages/login/login_screen.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/loginform.dart';

class WelcomeScreen extends StatelessWidget {
  
  
Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginForm(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuart;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9), // Greyish background
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
                    Image.network(
                      "https://s3-alpha-sig.figma.com/img/3509/98fc/5926bae03de06c6fdc2fe05b10fbe569?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XUARy0dJBg02~4AFToJ6b63RhOOERNXfsodxaMOJbTocXtlZQjprWjY58UNzSmq~nixWFDvCxsAKvb1MgRrUycLfsrz2gaNT3jYGDKCsPX65yFmdLY4p7Fud0od8Z2M4SEAST2awJkM2X-r~CA922N-N9cnk4kSa6ceyOKiT0xnQqZ1lW9-LrM2H7mfHpEuqT9vrrJvjLpa8WnledgkQ9lftwij3NBWKVy7LOAscx8FF1GE7TQhSNxB0G3X~VY-DDBzNGEhX~IZeuh-4vthjqys5ghUB~le61bxH6dv4otweIrP496Gq9Qs~96uE958q3YEaPikvcVnoN8gzEL~5kA__",
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
                          onPressed: () {                        Navigator.of(context).push(_createRoute());
 },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Set border radius to 0 for square look
                            ),
                            backgroundColor: Colors.grey[
                                800], // Set the button's background color to grey shade 800
                          ),
                          child: Text(
                            textAlign:
                                TextAlign.left, // Set text alignment to left

                            'Login',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.5, // Adjust line height
                                letterSpacing: 0.5,
                                color: Colors.white // Adjust letter spacing
                                ),
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
                          height: 1.5, // Adjust line height
                          letterSpacing: 0.5, // Adjust letter spacing
                          color: Colors.white, // Adjust text color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.fromLTRB(
                              20, 10, 20, 10), // Adjust padding
                          minimumSize:
                              Size(212, 48), // Set fixed width and height
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                            ),
                          ),
                          side: BorderSide.none, // Remove button border
                          elevation: 0, // Remove button elevation
                        ),
                        child: Text(
                          "Démarrer",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1.5, // Adjust line height
                            letterSpacing: 0.5, // Adjust letter spacing
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
