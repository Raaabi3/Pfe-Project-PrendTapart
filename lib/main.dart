import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/controllers/sondage_controller.dart';
import 'package:menu_digitale_tablette/controllers/theme_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/auth.dart';
import 'package:menu_digitale_tablette/helpers/providers/establishment.dart';
import 'package:menu_digitale_tablette/helpers/providers/products.dart';
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
          ChangeNotifierProvider(create: (_) => ProfessionalProvider()),
          //ChangeNotifierProvider(create: (_) => EstablishmentProvider()),
          
          ChangeNotifierProxyProvider<ProfessionalProvider,EstablishmentProvider>(
            create: (context) {
              final professionalProvider = Provider.of<ProfessionalProvider>(context, listen: false);
              return EstablishmentProvider(professionalProvider);
            },update: (_, professionalProvider, establishmentProvider) {
              establishmentProvider?.updateEstablishments();
              return establishmentProvider!;
            },
          ),
          
          ChangeNotifierProxyProvider<EstablishmentProvider,Productprovider>(
            create: (context) {
              final establishmentProvider = Provider.of<EstablishmentProvider>(context, listen: false);
              return Productprovider(establishmentProvider);
            },
            update: (_, establishmentProvider, productprovider) {
              productprovider?.updateProducts();
              return productprovider!;
            },
          ),
          //ChangeNotifierProvider(create: (_) => Productprovider(),

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