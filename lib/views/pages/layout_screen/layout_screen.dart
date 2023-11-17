import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/home_layout_controller.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeLayoutController>(
      builder: (context, value, child) {
        return value.getCurrentScreen();
      },
    );
  }
}
