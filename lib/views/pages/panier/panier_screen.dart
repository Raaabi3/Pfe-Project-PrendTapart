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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ma commande",
          style: headline,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  _cartprovider.cartItems.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(
                              _cartprovider.cartItems[index]?.img ?? '',
                              fit: BoxFit.fill,
                              height: 60,
                              width: 50,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              _cartprovider.cartItems[index].productName,
                              style: body,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              (_cartprovider.cartItems[index].price *
                                      _cartprovider.cartItems[index].quantity)
                                  .toStringAsFixed(2),
                              style: subhead.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    _cartprovider.incrementQuantity(index);
                                  },
                                ),
                                Text(
                                  _cartprovider.cartItems[index].quantity.toString(),
                                  style: subhead,
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    _cartprovider.decrementQuantity(index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    _cartprovider.removeItemFromCart(index);
                                  },
                                ),
                              ],
                            ),
                            if (_cartprovider.cartItems[index].selectedOptionsList != null)
  ..._cartprovider.cartItems[index].selectedOptionsList.map<Widget>((optionMap) {
    final group = optionMap.keys.first;
    final option = optionMap.values.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Text(
                '${group.name}: ',
                style: body.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                option.name,
                style: body,
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  _cartprovider.removeItemFromGroup(index, group, option);
                },
              ),
            ],
          ),
        ),
        if (group.is_required==1 && _cartprovider.cartItems[index].selectedOptionsList.where((map) => map.keys.first == group).length == 1)
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'At least one option is required',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }).toList(),
],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            height: 20,
          ),
        ],
      ),
    );
  }
}
