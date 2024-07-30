import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  List<Map<String, dynamic>> data = [
    {"name": "Dessert (100g serving)", "calories": 200, "selected": false},
    {"name": "Frozen yogurt", "calories": 159, "selected": false},
    {"name": "Ice cream sandwich", "calories": 237, "selected": false},
    {"name": "Eclair", "calories": 262, "selected": false},
    {"name": "Cupcake", "calories": 305, "selected": false},
    {"name": "Gingerbread", "calories": 356, "selected": false},
    {"name": "Jelly bean", "calories": 375, "selected": false},
    {"name": "Lollipop", "calories": 392, "selected": false},
    {"name": "Honeycomb", "calories": 408, "selected": false},
    {"name": "Donut", "calories": 452, "selected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFAFA),
      appBar: AppBar(
        title: const Text(
          'Data Table with Checkboxes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('Nutrition')),
                      DataColumn(label: Text('Calories')),
                    ],
                    rows: data
                        .map((item) => DataRow(
                              cells: [
                                DataCell(
                                  Checkbox(
                                    value: item["selected"],
                                    onChanged: (value) {
                                      setState(() {
                                        item["selected"] = value!;
                                      });
                                    },
                                  ),
                                ),
                                DataCell(Text(item["name"])),
                                DataCell(Text(item["calories"].toString())),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              List<String> selectedItems = data
                  .where((item) => item["selected"] == true)
                  .map((item) => item["name"] as String)
                  .toList();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Selected Options"),
                    content: Text(selectedItems.join(", ")),
                    actions: [
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Print Selected Options'),
          ),
        ],
      ),
    );
  }
}
