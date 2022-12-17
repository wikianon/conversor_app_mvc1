import 'package:flutter/material.dart';
import 'package:conversor_app_mvc1/app/views/home_page.dart';
import 'package:conversor_app_mvc1/app/views/components/home_view.dart';

void main() {
  runApp(const ConversorApp());
}

class ConversorApp extends StatelessWidget {
  const ConversorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Moeda',
      theme: ThemeData.dark(),
      //home: const HomeView(), //OK
      home: const MyHomePage(), //Erro na home_page.dart
    ); //MaterialApp
  }
}
