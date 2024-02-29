import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/controllers/sondage_controller.dart';
import 'package:menu_digitale_tablette/controllers/theme_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/views/pages/layout_screen/layout_screen.dart';
import 'package:menu_digitale_tablette/views/pages/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controllers/home_layout_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeLayoutController()),
          ChangeNotifierProvider(create: (_) => SondageController()),
          ChangeNotifierProvider(create: (_) => ThemeController()),
          ChangeNotifierProvider(create: (_) => ProfessionalProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home:  LoginPage(),
        ),
      ),
    );
  }
}
