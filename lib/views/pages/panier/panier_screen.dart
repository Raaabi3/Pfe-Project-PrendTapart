import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mon panier (${_cartprovider.cartItems.length})",
                              style: TextStyle(fontSize: 18),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                screenprovider.idlepanier();
                                context.read<ScreenController>().toggleScreen();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.red),
                                minimumSize:
                                    MaterialStateProperty.all<Size>(Size(200, 50)),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                  TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'poppins'),
                                ),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                "+ Ajouter des articles",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'poppins'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("List des article",
                                  style:
                                      TextStyle(fontFamily: 'poppins', fontSize: 16)),
                              Text("Quantité",
                                  style:
                                      TextStyle(fontFamily: 'poppins', fontSize: 16)),
                              Text("Prix",
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 16,
                                  )),
                              InkWell(
                                onTap: () {
                                  _cartprovider.clearCart();
                                },
                                child: Text("Effacer tout",
                                    style: TextStyle(
                                        color: Colors.red.shade500,
                                        fontFamily: 'poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _cartprovider.cartItems.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.network(
                                  _cartprovider.cartItems[index].img,
                                  fit: BoxFit.fill,
                                  height: 60,
                                  width: 50,
                                ),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [Text(_cartprovider.cartItems[index].product.name),
                                  for (int i = 0; i < (showAllOptions[index]
                                      ? _cartprovider.cartItems[index]
                                          .selectedOptionsList.length
                                      : 2); i++)
                                    Text(
                                      "• ${_cartprovider.cartItems[index].selectedOptionsList[i].values.first.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16) ,
                                    ),
                                  if (_cartprovider.cartItems[index].selectedOptionsList.length > 2 &&
                                      !showAllOptions[index])
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          showAllOptions[index] = true;
                                        });
                                      },
                                      child: Text('voir plus',style: TextStyle(color:Colors.red.shade500 ,fontSize: 12,fontFamily: "poppins",fontWeight: FontWeight.w400)),
                                    ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Transform.scale(
                                            scaleX: 1.2,
                                            child: Icon(
                                              Icons.indeterminate_check_box,
                                              color: const Color.fromARGB(
                                                  255, 58, 50, 68),
                                              size: 40,
                                            ),
                                          ),
                                          onPressed: () {
                                            _cartprovider.decrementQuantity(index);
                                          },
                                        ),
                                        Text(
                                          _cartprovider.cartItems[index].quantity
                                              .toString(),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _cartprovider.incrementQuantity(index);
                                          },
                                          icon: Transform.scale(
                                            scaleX: 1.2,
                                            child: Icon(
                                              Icons.add_box,
                                              color: const Color.fromARGB(
                                                  255, 58, 50, 68),
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text("€"+(_cartprovider.getTotalPrice())
                                          .toStringAsFixed(2),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red,
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          _cartprovider.removeItemFromCart(index);
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
                              width: 250, // Define the width of the button
                              child: ElevatedButton(
                                onPressed: () {
                                  if(_cartprovider.cartItems.length>0){
                                    double total = _cartprovider.getTotalPrice();
                                  _commandeprovider.createCommande(
                                      _commandeprovider.token!,
                                      total,
                                      _cartprovider.cartItems);
                                  }
                    
                                  context
                                      .read<HomeLayoutController>()
                                      .switchScreen(3);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SuccessDialog();
                                    },
                                  );
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(Colors.red),
                                    textStyle: MaterialStateProperty.all<TextStyle>(
                                      TextStyle(color: Colors.white),
                                    ),
                                    minimumSize: MaterialStateProperty.all<Size>(
                                        Size(200, 65)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14.0),
                                      ),
                                    )),
                                child: Text(
                                  "Passer la commande " +
                                      _cartprovider
                                          .getTotalPrice()
                                          .toStringAsFixed(2),
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10,30,0,0),
                        child: Text("Suggestions de plats pour vous",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("assets/images/cart.png", scale: 0.6),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Ajouter des articles pour commencer ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        screenprovider.idlepanier();
                        context.read<ScreenController>().toggleScreen();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(200, 50)),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(color: Colors.white)),
                      ),
                      child: Text(
                        'Commencer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
