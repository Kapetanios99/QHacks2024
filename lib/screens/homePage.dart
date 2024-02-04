import 'package:flutter/material.dart';
import 'package:call_safe/main.dart';
import 'package:call_safe/widgets/upload.dart';
import 'package:call_safe/widgets/transcribedText.dart';
import 'package:call_safe/widgets/scamDetected.dart';
import 'package:call_safe/widgets/noScamDetected.dart';
import 'dart:math';
import 'package:call_safe/requests.dart';
import 'package:provider/provider.dart';

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
    
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 149, 243),
        title: const Center(child: Text("CallSafe", textAlign: TextAlign.center,)) ,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...appState.cardsList,
              // FutureBuilder(
              //   future: futurePythonData, 
              //   builder: (context, snapshot){
              //     if(snapshot.hasData) {
              //       return Text(snapshot.data!.result);
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }
      
              //     //by default
              //     return const CircularProgressIndicator();
              //   }
              //     ),
            ]
          ),
        ),
      ),
    );
  }
}
