import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/welcome_screen.dart';

class PlanDeTableScreen extends StatefulWidget {
  const PlanDeTableScreen({Key? key}) : super(key: key);

  @override
  _PlanDeTableScreenState createState() => _PlanDeTableScreenState();
}

class _PlanDeTableScreenState extends State<PlanDeTableScreen> {
  List<int> tables = List.generate(8, (index) => index + 1);
  int availableTables = 5;
  int usedTables = 3;
  List<int> selectedTables = [];

  bool get isTableSelected => selectedTables.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Plan de tables",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Personaliser votre menu",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Disponible",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "$availableTables tables",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Utilisée",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "$usedTables tables",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // Wrap the GridView.builder with Expanded
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 50,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: tables.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final tableNumber = tables[index];
                      final isSelected = selectedTables.contains(tableNumber);
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedTables.remove(tableNumber);
                            } else {
                              selectedTables.add(tableNumber);
                              Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                        );
                            }
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.green
                                      : Colors.transparent,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/table.png",
                                height: 80,
                                width: 80,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Table ${index + 1}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.green : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Table a deux",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void _handleChooseTable() {
    // Handle choosing the table here
    print('Tables selected: $selectedTables');
  }
}
