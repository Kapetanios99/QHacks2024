import 'package:flutter/material.dart';

class ScamDetected extends StatelessWidget {
  const ScamDetected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.red,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.warning_sharp,
                size: 27,
                ),
              Text.rich(
                TextSpan(
                  text: ("ALERT! THIS CALL IS A SCAM"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )
                )
              ),
              Icon(
                Icons.warning_sharp,
                size: 27,
                ),
            ],
          ),
        )
      );
  }
}