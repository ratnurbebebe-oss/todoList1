import 'package:flutter/material.dart';
import 'package:flutter_todolist_1/home/home_page.dart';
import 'package:flutter_todolist_1/sattingg/Sattingg_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

 @override
  State<MyApp> createState()=> MyAppState();
}
class MyAppState extends State<MyApp>{
  bool isDark=false;
   void  changeTheme(){
    setState(() {
      isDark=!isDark;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: isDark ? ThemeMode.dark: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: "Главный экран",
      isDark: isDark,
       onThemeChanged: changeTheme),
    );
  }
}

