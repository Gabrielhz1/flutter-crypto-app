
import 'package:flutter/material.dart';
import './pages/Moedas_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'moedasbase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo
        ),

        home: MoedasPage(),
    );
  }
}