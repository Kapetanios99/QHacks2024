import 'package:flutter/material.dart';

class NoScamDetected extends StatelessWidget {
  const NoScamDetected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.green,
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.check,
                size: 27,
                color: Colors.white,
                ),
              Text.rich(
                TextSpan(
                  text: ("THIS CALL IS SAFE"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  )
                )
              ),
              Icon(
                Icons.check,
                size: 27,
                color: Colors.white,
                ),
            ],
          ),
        )
      );
  }
}