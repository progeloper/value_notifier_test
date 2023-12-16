import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value Notifier Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<double> sizeNotifier = ValueNotifier(100.0);

  void onSizeChanged(){
    sizeNotifier.value = Random().nextDouble() * 10;
  }
  Widget getOGContainer(){
    return Container(
      height: 100,
      width: 100,
      constraints: BoxConstraints(
        maxHeight: 600,
        maxWidth: 600,
      ),
      color: Colors.pinkAccent[400],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifiers'),
      ),
      body: Center(
        child: ValueListenableBuilder(valueListenable: sizeNotifier, child: getOGContainer(), builder: (context, n, c){
          return Transform.scale(
            scale: n,
            child: c,
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onSizeChanged,
        child: const Icon(Icons.recycling),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
