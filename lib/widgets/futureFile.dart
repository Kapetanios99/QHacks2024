import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:call_safe/functions/audioUpload.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
      future: uploadAudio(context),
      
      builder: (BuildContext context, AsyncSnapshot<PlatformFile> snapshot) {
        if (snapshot.hasData) {
          return const Text(
            "File Uploaded!",
            textAlign: TextAlign.center,
            );
        }
        else {
          return const Text(
            "Loading....",
            textAlign: TextAlign.center,
            );
        }
      }
    );
  }
}