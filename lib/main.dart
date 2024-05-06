import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/my_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}
