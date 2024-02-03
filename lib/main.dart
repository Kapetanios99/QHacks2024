import 'package:flutter/material.dart';
import 'package:call_safe/widgets/upload.dart';
import 'package:call_safe/widgets/transcribedText.dart';
import 'package:call_safe/widgets/scamDetected.dart';
import 'package:call_safe/widgets/noScamDetected.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CallSafe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CallSafe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int alert = 0;

  var cardsList = <Widget>[
    Upload(),
    TranscribedText(),
  ];

  void checkScam() {
    setState(() {
      int random = Random().nextInt(2);

      if(alert == 1) {
        cardsList.removeAt(cardsList.length - 1);
      }

      if (random == 0) {
        cardsList.add(ScamDetected());
      } 
      else {
        cardsList.add(NoScamDetected());
      }

      alert = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...cardsList,
            TextButton(
              onPressed: () => checkScam(),
              child: Text("CHECK"),
              ),
          ]
        ),
      ),
    );
  }
}
