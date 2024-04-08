import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: isTableSelected ? _handleChooseTable : null,
        child: const Text('Choisir'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/cocuisinage_logo.png"),
                  Text(
                    "Cocuisinage",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Plan de Table",
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
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
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: Colors.pink,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Text(
                            "Bienvenu chez Cocuisinage",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    color: isSelected ? Colors.green : Colors.transparent,
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
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleChooseTable() {
    // Handle choosing the table here
    print('Tables selected: $selectedTables');
  }
}
