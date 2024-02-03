import 'package:flutter/material.dart';
import 'package:call_safe/screens/homePage.dart';
import 'package:call_safe/main.dart';
import 'package:provider/provider.dart';
import 'package:call_safe/widgets/futureFile.dart';

class Upload extends StatefulWidget {
  const Upload({
    super.key,
    });

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override 
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Upload an Audio File"
            ),
            IconButton(
              icon: Icon(Icons.upload),
              onPressed: () => {
                appState.addCard(FutureFile())
              },
            ),
          ]
        ),
      )
    );
  }
}