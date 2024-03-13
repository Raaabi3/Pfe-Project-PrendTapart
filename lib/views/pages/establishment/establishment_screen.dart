import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/establishment.dart';
import 'package:provider/provider.dart';

class EstablishmentsScreen extends StatefulWidget {
  @override
  _EstablishmentsScreenState createState() => _EstablishmentsScreenState();
}

class _EstablishmentsScreenState extends State<EstablishmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: Consumer<EstablishmentProvider>(
        builder: (context, provider, _) {
          if (provider.establishments.isEmpty) {
            provider.getEstablishments(); 
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.establishments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.establishments[index].name),
                  subtitle: Text('Quantity: ${provider.establishments[index].zipCode}'),
                  onTap: () {
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
