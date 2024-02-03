import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:call_safe/functions/audioUpload.dart';

class FutureFile extends StatefulWidget {
  const FutureFile({
    super.key,
    });

  @override
  State<FutureFile> createState() => _FutureFileState();
}

class _FutureFileState extends State<FutureFile> {

  @override 
  Widget build(BuildContext context) {
    return FutureBuilder<PlatformFile> (
      future: uploadAudio(),

      builder: (BuildContext context, AsyncSnapshot<PlatformFile> snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        }
        else {
          return Text("Loading....");
        }
      }
    );
  }
}