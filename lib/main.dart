import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/controllers/sondage_controller.dart';
import 'package:menu_digitale_tablette/controllers/theme_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Auth.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Commandes.dart';
import 'package:menu_digitale_tablette/helpers/providers/Establishments.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/welcome_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'controllers/home_layout_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return ResponsiveSizer(
        builder: (p0, p1, p2) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HomeLayoutController()),
            ChangeNotifierProvider(create: (_) => SondageController()),
            ChangeNotifierProvider(create: (_) => ThemeController()),
            ChangeNotifierProvider(create: (_) => Auth()),
            ChangeNotifierProxyProvider<Auth, Establishments>(
              create: (context) => Establishments()..updateEstablishments(),
              update: (_, professionalProvider, establishments) =>
                  establishments!
                    ..getdata(professionalProvider.token)
                    ..getselectedestab(
                        professionalProvider.selectedestablishment),
            ),
            ChangeNotifierProxyProvider<Establishments, Products>(
              create: (context) => Products(),
              update: (_, establishments, products) => products!
                /*..updateProducts()*/
                ..getdata(establishments.token!),
            ),
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProxyProvider<Auth, Commandes>(
                create: (context) => Commandes(),
                update: (_, professionalProvider, commandes) =>
                    commandes!..getdata(professionalProvider.token!)),
            ChangeNotifierProvider(create: (_) => ScreenController()),
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              home:
                  WelcomeScreen() //LoginPage()//HistoryScreen()//PlanDeTableScreen() //CommandHistoryScreen() TableSelectionScreen()//PinCodeScreen() ,
              ),
        ),
      );
    });
  }
}
