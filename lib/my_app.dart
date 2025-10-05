
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/home_page.dart';


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

        home: HomePage(),
    );
  }
}