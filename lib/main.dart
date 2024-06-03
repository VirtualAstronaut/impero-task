import 'package:flutter/material.dart';
import 'package:impero_task/api_service/dio_service.dart';
import 'package:impero_task/homepage/view/home_page.dart';

void main() {
  DioService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
