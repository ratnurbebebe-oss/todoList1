import 'package:flutter/material.dart';
import 'package:flutter_todolist_1/home/home_page.dart';
class SattinggPage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onThemeChanged;
  const SattinggPage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });
  @override
  State<SattinggPage> createState() => _SatingPageState();
}

class _SatingPageState extends State<SattinggPage> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Выберите тему:'),
          Switch(value: widget.isDark, onChanged: (value){
            widget.onThemeChanged();
          }),
            
            
            
            
          ],
        ),
      ),
    );
  }
 
}
