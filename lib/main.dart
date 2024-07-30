import 'package:checkliar/checklist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Table with Checkboxes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckList(),
    );
  }
}
