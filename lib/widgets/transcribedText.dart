import 'package:flutter/material.dart';

class TranscribedText extends StatefulWidget {
  const TranscribedText({
    super.key,
    });

  @override
  State<TranscribedText> createState() => _TranscribedTextState();
}

class _TranscribedTextState extends State<TranscribedText> {

  @override 
  Widget build(BuildContext context) {
    return const Card(
      child: Text("Hello I am contacting you about a potential"
      + " issue with your CIBC account..."),
    );
  }
}