import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:menu_digitale_tablette/helpers/providers/Commandes.dart';
import 'package:menu_digitale_tablette/models/commande_model.dart';

class CommandesScreen extends StatefulWidget {
  const CommandesScreen({Key? key}) : super(key: key);

  @override
  State<CommandesScreen> createState() => _CommandesScreenState();
}

class _CommandesScreenState extends State<CommandesScreen> {
  List<bool> showAllOptions = [];

  @override
  Widget build(BuildContext context) {
    Commandes cmdProvider = Provider.of<Commandes>(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text("Ma commande ()",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Commande attente',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'poppins',
                                color: Color.fromRGBO(23, 87, 129, 1))),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),                            color: Color.fromRGBO(244, 244, 244, 1),
 ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text('Temps estimé :'),
                                  Icon(Icons.timer,
                                      size: 15,
                                      color: Color.fromRGBO(219, 71, 90, 1)),
                                  Text('10-15 mins'),
                                ],
                              ),
                            )),
                        SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(244, 244, 244, 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Products'),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<Commandes>(
                    builder: (context, commandesProvider, child) {
                      if (commandesProvider.commandes == null ||
                          commandesProvider.commandes!.isEmpty) {
                        return Center(
                          child: Text("No commandes found."),
                        );
                      }
                      return ListView.separated(
                        itemCount: commandesProvider.commandes!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, commandeIndex) {
                          final commande =
                              commandesProvider.commandes![commandeIndex];

                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: ExpansionTile(
                              title:
                                  Text('ID Commande #${commande.commande_id}',style: TextStyle(color: Color.fromRGBO(221, 37, 53, 1) ,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "poppins"),),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ..._buildProductInfoList(
                                          commande, context, commandeIndex),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: Text("Suggestions de plats pour vous",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProductInfoList(
      Commande commande, BuildContext context, int commandeIndex) {
    List<Widget> productInfoList = [];
    if (commande.products != null) {
      for (int productIndex = 0;
          productIndex < commande.products!.length;
          productIndex++) {
        productInfoList.add(_buildProductInfo(context, commandeIndex,
            productIndex, commande.products![productIndex], commande));
      }
    }
    return productInfoList;
  }

  Widget _buildProductInfo(BuildContext context, int commandeIndex,
      int productIndex, dynamic product, Commande commande) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 89,
                width: 122,
                child: Image.network(
                    "${product.establishmentProducts[0]['image']}",),decoration:BoxDecoration(borderRadius: BorderRadius.circular(14))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                if (commande.options != null && commande.options!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: commande.options!.sublist(0, 2).map((option) {
                          return Text(
                            "${option['option']}",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          );
                        }).toList(),
                      ),
                      if (commande.options!.length > 2)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // showAllOptions[productIndex] = !showAllOptions[productIndex];
                            });
                          },
                          child: Text(
                            "Voir plus",
                            //showAllOptions[productIndex] ? "Voir moins" : "Voir plus",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
            Text("estimated 15 min"),
            Container(
decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(255, 248, 224, 1),
),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${commande.status}",style: TextStyle(color: Color.fromRGBO(255, 153, 0, 1))),
              )),
          ],
        ),
        Divider(),
//      if (showAllOptions[productIndex] && commande.options != null && commande.options!.length > 2)
      ],
    );
  }
}
