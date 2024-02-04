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
                size: 29,
                color: Colors.white,
                ),
              Text.rich(
                TextSpan(
                  text: ("ALERT! THIS CALL IS A SCAM"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  )
                )
              ),
              Icon(
                Icons.warning_sharp,
                size: 29,
                color: Colors.white,
                ),
            ],
          ),
        )
      );
  }
}