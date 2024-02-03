import 'package:flutter/material.dart';

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
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Upload an audio file"
            ),
            Icon(
              Icons.upload
            ),
          ]
        ),
      )
    );
  }
}