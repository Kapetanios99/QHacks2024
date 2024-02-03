import 'package:flutter/material.dart';

class NoScamDetected extends StatelessWidget {
  const NoScamDetected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[400],
      child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text("This call was determined unlikely to be a scam, but remain cautious!"),
        )
      );
  }
}