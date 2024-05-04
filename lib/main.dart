import 'package:api_workshop/examples/basic/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ApiWorkshopApp());
}

class ApiWorkshopApp extends StatelessWidget {
  const ApiWorkshopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
