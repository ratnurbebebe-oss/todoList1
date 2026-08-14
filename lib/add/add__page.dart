import 'package:flutter/material.dart';

import 'dart:async';

class AddPage extends StatefulWidget {
  //создать состояние =виделить память для statefull виджет
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late Timer _timer;

  void _incrementCounter() {
    setState(() {});
  }

  //создать в память-виджет появляеться в оперативной памяти
  @override
  void initState() {
    super.initState();

    print("Home Page -initState");
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("${date.minute} : ${date.second}");
    });
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   //при обновлении тем. языков и т д (глобалтый изменение)
  //    print("add Page - dodChangeDependeces");
  // }
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("add Page -build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "ВВедиет текс",
                border: OutlineInputBorder(),
              ),
              controller: controller,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text(
                "Сохранить",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    //таймер выключать
    //слушателей (Controller)выключать
    // шателей (Stream)
    _timer.cancel();
    controller.dispose();
    super.dispose();
    print("add Page -dispose");
  }
}
