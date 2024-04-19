import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/views/widgets/dialogs/success_diag.dart';
import 'package:menu_digitale_tablette/views/widgets/parametre/parametre_button.dart';
import 'package:provider/provider.dart';

class PanierScreen extends StatelessWidget {
  const PanierScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartprovider = Provider.of<CartProvider>(context);
    final Products prodprovider = Provider.of<Products>(context);

    int qte = 1;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xffEDEDED),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Spacer(),
                  Text(
                    "Ma commande",
                    style: headline,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child:Column(
  children: [
    ...List.generate(
      _cartprovider.cartItems.length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 7),
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          cartProvider.cartItems[index]?.img ?? '',
                          fit: BoxFit.fill,
                          height: 60,
                          width: 50,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cartProvider.cartItems[index].productName,
                              style: body,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              (cartProvider.cartItems[index].price *
                                      cartProvider
                                          .cartItems[index].quantity)
                                  .toStringAsFixed(2),
                              style: subhead.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8),
                                    color: const Color(0xff3A3244),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      cartProvider
                                          .incrementQuantity(index);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  cartProvider.cartItems[index].quantity
                                      .toString(),
                                  style: subhead,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8),
                                    color: const Color(0xff3A3244),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: GestureDetector(
                                      onTap: () {
                                        cartProvider
                                            .decrementQuantity(index);
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8),
                                    color: const Color(0xff3A3244),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: GestureDetector(
                                      onTap: () {
                                        cartProvider
                                            .removeItemFromCart(index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (cartProvider.cartItems[index].selectedOptionsList !=
                                null)
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: cartProvider
                                    .cartItems[index].selectedOptionsList
                                    .map<Widget>((option) {
                                  return Row(
                                    children: [
                                      Text(
                                        '${option['group'].name}: ${option['option'].name}',
                                        style: body, 
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle),
                                        onPressed: () {
                                          cartProvider.removeItemFromGroup(
                                              index,
                                              option['group'],
                                              option['option']);
                                        },
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  ],
),

            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ParametreButton(
              buttonText: "Passer Commande",
              onTap: () {
                Navigator.pop(context);
                context.read<HomeLayoutController>().switchScreen(3);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SuccessDialog();
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ParametreButton(
              buttonText: "Vider Panier",
              onTap: () {
                _cartprovider.clearCart();
              },
              color: Color(0xffEEEEEE),
              textColor: Color(0xff626262),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
