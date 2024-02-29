
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/professional_model/professional_model.dart';

class ProfessionalProvider extends ChangeNotifier {
  String token = "";
  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";
  List<ProfessionalModel> professional = [];
  late BuildContext context; // Add the context variable

void setContext(BuildContext _context) {
  context = _context;
}
}