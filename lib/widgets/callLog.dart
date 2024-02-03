// ignore_for_file: prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:flutter/material.dart';
import 'dart:math';

class CallLog extends StatefulWidget {
  const CallLog({
    super.key,
    });

  @override
  State<CallLog> createState() => _CallLogState();
}

class _CallLogState extends State<CallLog> {

  String randomPhoneNum() {
    List<String> areaCodes = ["905", "416", "647"];

    return ("(" + areaCodes[Random().nextInt(3)] + ") " + (Random().nextInt(899) + 100).toString() + "-" + (Random().nextInt(8999) + 1000).toString());
  }

  @override 
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.phone
            ),
            Text(
              randomPhoneNum()
            ),
            const Icon(
              Icons.more_vert
            ),
          ]
        ),
      )
    );
  }
}