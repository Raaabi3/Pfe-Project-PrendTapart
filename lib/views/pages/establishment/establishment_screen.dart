import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';
import 'package:menu_digitale_tablette/helpers/providers/Auth.dart';
import 'package:menu_digitale_tablette/helpers/providers/Establishments.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:provider/provider.dart';

class EstablishmentsScreen extends StatefulWidget {
  @override
  _EstablishmentsScreenState createState() => _EstablishmentsScreenState();
}

class _EstablishmentsScreenState extends State<EstablishmentsScreen> {
  @override
  Widget build(BuildContext context) {
    final Products prodProvider = Provider.of<Products>(context);
    final Auth authProvider = Provider.of<Auth>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 82, 60, 95),
      appBar: AppBar(
        title: Text('Establishments List'),
      ),
      body: Consumer<Establishments>(
        builder: (context, provider, _) {
          if (provider.establishments.isEmpty) {
            return Center(
              child: Image.network(
                'https://static.wixstatic.com/media/86db9f_8068af7e0840429baadcc64cbf155c0f~mv2.gif',
                alignment: Alignment.center,
                color: Colors.white,
                repeat: ImageRepeat.repeat,
                gaplessPlayback: true,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.establishments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    onTap: () async {
                      authProvider.selectedestablishment =
                          provider.establishments[index];
                      print('Establishment selected: ${provider.establishments[index].id}');
                      await prodProvider.fetchcategory(provider.establishments[index].id);
                      prodProvider.fetchproductbycategory();
                      print('Fetched categories: ${prodProvider.categories}');
                      if (prodProvider.categories.isNotEmpty) {
                        print('Navigating to HomeScreen');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      } else {
                        print('No categories available');
                      }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                              child: Image.network(
                                provider.establishments[index].covImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IntrinsicWidth(
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        provider.establishments[index].img,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.establishments[index].name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Zip Code: ${provider.establishments[index].zipCode}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'City: ${provider.establishments[index].city}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
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
              },
            );
          }
        },
      ),
    );
  }
}
