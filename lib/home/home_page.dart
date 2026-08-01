import 'package:flutter/material.dart';
import 'package:flutter_todolist_1/add/add__page.dart';
import 'package:flutter_todolist_1/sattingg/Sattingg_page.dart';

class MyHomePage extends StatefulWidget {
 
final bool isDark;
  final String title;
  final VoidCallback onThemeChanged;
   const MyHomePage({super.key, 
   required this.title,
    required this.onThemeChanged,
     required this.isDark});
  //создать состояние =виделить память для statefull виджет
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<Note> notes = [];

  void _incrementCounter() {
    setState(() {});
  }

  //создать в память-виджет появляеться в оперативной памяти
  @override
  void initState() {
    super.initState();
    //запускать таймеры или анимации
    //Инициализировать свойство

    //подгружать данны с сети и локального хранилиша

    print("Home Page -initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //при обновлении тем. языков и т д (глобалтый изменение)
    print("Home Page - dodChangeDependeces");
  }

  @override
  Widget build(BuildContext context) {
    print("Home Page -build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: widget.onThemeChanged,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
            
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SattinggPage(
                  isDark: widget.isDark,
                  onThemeChanged: widget.onThemeChanged,
                )),
              );
            },
          ),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Expanded(
              
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,

                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    

                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: notes[index].isDone,
                                onChanged: (value) {
                                  setState(() {
                                    notes[index].isDone = value ?? false;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  notes[index].text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    decoration: notes[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    notes.removeAt(index);
                                  });
                                },
                              ),

                            ],
                          ),
                           Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "01.08.2026",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: anAddTap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void anAddTap() async {
    final String? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPage()),
    );
    if (result != null) {
      setState(() {
        notes.add(Note(text: result));
      });
    }

    // void _onSaveTop(){
    //   final controller = TextEditingController();
    //   TextField(
    //     controller: controller,
    //   );
    //  Navigator.pop(context, controller.text);
    // }
  }

  @override
  void dispose() {
    super.dispose();
    //таймер выключать
    //слушателей (Controller)выключать
    //слашателей (Stream)
    print("Home Page -dispose");
  }
}

class Note {
  String text;
  bool isDone;
  DateTime dateTime = DateTime.now();
  Note({required this.text, this.isDone = false});
}
