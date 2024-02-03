import 'package:flutter/material.dart';

class ScamDetected extends StatelessWidget {
  const ScamDetected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[900],
      child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text("ALERT! THIS CALL IS LIKELY A SCAM"),
        )
      );
  }
}