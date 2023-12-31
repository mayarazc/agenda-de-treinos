import 'package:flutter/material.dart';
import 'package:agendadetreinos/view/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('treinos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
    );
  }
}