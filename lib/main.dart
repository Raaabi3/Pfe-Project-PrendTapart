import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/controllers/sondage_controller.dart';
import 'package:menu_digitale_tablette/controllers/theme_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Auth.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Establishments.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/views/pages/establishment/establishment_screen.dart';
import 'package:menu_digitale_tablette/views/pages/historique/commande_screen.dart';
import 'package:menu_digitale_tablette/views/pages/historique/history_screen.dart';
import 'package:menu_digitale_tablette/views/pages/login/login_screen.dart';
import 'package:menu_digitale_tablette/views/pages/plan_de_table/plan_de_table_screen.dart';
import 'package:menu_digitale_tablette/views/pages/suivi_commande_et_jeux/suivie_commande_jeux_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'controllers/home_layout_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
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
                  ..updateEstablishments()
                  ..getdata(professionalProvider.token)
                  ..getselectedestab(professionalProvider.selectedestablishment),
          ),
          ChangeNotifierProxyProvider<Establishments, Products>(
            create: (context) => Products(),
            update: (_, establishments, products) => products!
              ..updateProducts()
..getdata(establishments.token!),
          ),
          ChangeNotifierProvider(create: (_) => CartProvider()),

          

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: LoginPage()//HistoryScreen()//PlanDeTableScreen() //CommandHistoryScreen() TableSelectionScreen()//PinCodeScreen() ,
        ),
      ),
    );
  }
}
