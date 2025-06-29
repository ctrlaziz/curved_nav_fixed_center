import 'package:flutter/material.dart';
import 'basic_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curved Nav Fixed Center Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF45319F)),
        useMaterial3: true,
      ),
      home: const BasicExample(),
      debugShowCheckedModeBanner: false,
    );
  }
} 