import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Возвращение значения')),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              String _message = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
              if (_message != "") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(_message),
                  backgroundColor: Colors.pink,
                ));
              }
            },
            child: const Text('Приступить к выбору...')),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Выберите любой вариант')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Да!');
              },
              child: const Text('Да!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Нет!");
              },
              child: const Text('Нет!'),
            ),
          ],
        )));
  }
}

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => const FirstScreen(),
    '/second': (BuildContext context) => const SecondScreen()
  }));
}
