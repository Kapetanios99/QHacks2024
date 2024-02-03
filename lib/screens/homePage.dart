import 'package:flutter/material.dart';
import 'package:call_safe/widgets/upload.dart';
import 'package:call_safe/widgets/transcribedText.dart';
import 'package:call_safe/widgets/scamDetected.dart';
import 'package:call_safe/widgets/noScamDetected.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // keep track of if there's an active alert
  int alert = 0;

  var cardsList = <Widget>[
    Upload(),
    SizedBox(height: 30),
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
              child: const Text("CHECK"),
              ),
          ]
        ),
      ),
    );
  }
}