import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Commandes.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/views/widgets/dialogs/success_diag.dart';
import 'package:provider/provider.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({Key? key}) : super(key: key);

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  bool _isContentVisible = false;
  List<bool> showAllOptions = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final _cartprovider = context.read<CartProvider>();
      showAllOptions = List<bool>.filled(_cartprovider.cartItems.length, false);
      setState(() {
        _isContentVisible = _cartprovider.cartItems.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartprovider = Provider.of<CartProvider>(context);
    final Commandes _commandeprovider = Provider.of<Commandes>(context);
    final ScreenController screenprovider =
        Provider.of<ScreenController>(context);

    return Scaffold(
      body: _isContentVisible
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                  2.361111111111111.w, 2.5.h, 4.444444444444445.w, 0),
              child: Row(
                children: [
                  Container(
                    width: 55.w,
                    child: Flexible(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8.083333333333334.w,
                                height: 3.229166666666667.h,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "Mon panier (${_cartprovider.cartItems.length})",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 4.7917.h,
                                width: 12.5.w,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Provider.of<HomeLayoutController>(context,
                                            listen: false)
                                        .currentFoodTypeIndex = 0;
                                    screenprovider.idlepanier();
                                    context
                                        .read<ScreenController>()
                                        .toggleScreen();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(248, 113, 125, 1)),
                                    textStyle:
                                        MaterialStateProperty.all<TextStyle>(
                                      TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.dp,
                                          fontFamily: 'poppins'),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: AutoSizeText(
                                        "+ Ajouter des articles",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'poppins',
                                            fontSize: 1.25.h),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: 53.125.w,
                              height: 6.4583.h,
                              padding: EdgeInsets.only(left: 5.dp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 8.541666666666666.w,
                                    height: 2.5.h,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text("List des article",
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Container(
                                    width: 8.541666666666666.w,
                                    height: 2.5.h,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text("Quantité",
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                  SizedBox(width: 1.w,),
                                  Container(
                                    width: 8.541666666666666.w,
                                    height: 2.5.h,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text("Prix",
                                          style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 1.2.w,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                  Container(
                                    width: 8.541666666666666.w,
                                    height: 2.5.h,
                                    child: InkWell(
                                      onTap: () {
                                        _cartprovider.clearCart();
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text("Effacer tout",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 48, 65, 1),
                                                fontFamily: 'poppins',
                                                fontSize: 1.2.w,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              itemCount: _cartprovider.cartItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                        top: 4.895833333333333.h),
                                    child: Container(
                                      width: 10.44861.w,
                                      height: 11.4583.h,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            _cartprovider.cartItems[index].img,
                                            fit: BoxFit.cover,
                                            width: 10.44861.w,
                                            height: 11.4583.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 4.895833333333333.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 2.1875.h,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  _cartprovider
                                                      .cartItems[index]
                                                      .product
                                                      .name,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.0416666666666665.h,
                                            ),
                                            for (int i = 0;
                                                i <
                                                    (showAllOptions[index]
                                                        ? _cartprovider
                                                            .cartItems[index]
                                                            .selectedOptionsList
                                                            .length
                                                        : 2);
                                                i++)
                                              Container(
                                                height: 1.6666666666666667.h,
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    " • ${_cartprovider.cartItems[index].selectedOptionsList[i].values.first.name}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            SizedBox(
                                              height: 0.5208333333333333.h,
                                            ),
                                            if (_cartprovider
                                                        .cartItems[index]
                                                        .selectedOptionsList
                                                        .length >
                                                    2 &&
                                                !showAllOptions[index])
                                              GestureDetector(
                                                child: Container(
                                                  height:
                                                      1.6666666666666667.h,
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text('voir plus',
                                                        style: TextStyle(
                                                            color: Color
                                                                .fromRGBO(
                                                                    238,
                                                                    48,
                                                                    65,
                                                                    1),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "poppins",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    showAllOptions[index] =
                                                        true;
                                                  });
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7.229166666666666.h),
                                        child: Container(
                                          width: 6.458333333333334.w,
                                          height: 2.7083333333333335.h,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Transform.scale(
                                                    scaleX: 1.2,
                                                    child: Icon(
                                                      Icons
                                                          .indeterminate_check_box,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 58, 50, 68),
                                                      size: 3.w,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    _cartprovider
                                                        .decrementQuantity(
                                                            index);
                                                  },
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    _cartprovider
                                                        .cartItems[index].quantity
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    _cartprovider
                                                        .incrementQuantity(
                                                            index);
                                                  },
                                                  icon: Transform.scale(
                                                    scaleX: 1.2,
                                                    child: Icon(
                                                      Icons.add_box,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 58, 50, 68),
                                                      size: 3.w,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 7.229166666666666.h),
                                        child: Container(
                                          width: 3.5416666666666665.w,
                                          height: 2.3958333333333335.h,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Text(
                                              "€" +
                                                  ((_cartprovider
                                                              .cartItems[index]
                                                              .price) *
                                                          _cartprovider
                                                              .cartItems[index]
                                                              .quantity)
                                                      .toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 6.395833333333333.h),
                                        child: GestureDetector(
                                          child: Container(
                                            height: 3.854166666666667.h,
                                            width: 2.7777777777777777.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromRGBO(
                                                  248, 113, 125, 1),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                                size: 5,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            _cartprovider
                                                .removeItemFromCart(index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 19.3056.w,
                                height: 5.8333.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_cartprovider.cartItems.length > 0) {
                                      double total =
                                          _cartprovider.getTotalPrice();
                                      _commandeprovider.createCommande(
                                          _commandeprovider.token!,
                                          total,
                                          _cartprovider.cartItems);
                                    }

                                    Provider.of<ScreenController>(context,
                                            listen: false)
                                        .toggleCommandeScreen();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(238, 48, 65, 1)),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        TextStyle(color: Colors.white),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      )),
                                  child: Container(
                                    width: 15.347222222222223.w,
                                    height: 2.5.h,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Passer la commande " +
                                            _cartprovider
                                                .getTotalPrice()
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.875,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 2.5.h,
                        width: 16.7361.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Suggestions de plats pour vous",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          height: 30.h,
                          width: 30.w,
                          child: Image.asset("assets/images/cart.png",
                              scale: 0.6)),
                    ),
                    Container(
                      height: 3.75.h,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Ajouter des articles pour commencer ',
                          style: TextStyle(
                              fontSize: 1.1111.w,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(61, 61, 61, 1)),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      width: 17.2917.w,
                      height: 5.8333.h,
                      child: ElevatedButton(
                        onPressed: () {
                          screenprovider.idlepanier();
                          context.read<ScreenController>().toggleScreen();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(238, 48, 65, 1)),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(18.w, 8.h)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.white)),
                        ),
                        child: Container(
                          height: 2.5.h,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Commencer',
                              style: TextStyle(
                                  fontSize: 1.1111.w,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
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
