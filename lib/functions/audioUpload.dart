import 'dart:io';

/*
  This asynchronous function opens the file picker, allowing the user
  to pick an audio file. The audio file is then played, and an instance
  of the PlatformFile class with info on the newly cahced file is returned.
*/

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:call_safe/main.dart';
import 'package:provider/provider.dart';

Future<PlatformFile> uploadAudio(BuildContext context) async {
  var appState = context.watch<MyAppState>();

  if (appState.pressed == 1) {
    FilePickerResult? result = await FilePicker.platform.pickFiles(dialogTitle: "Pick file to analyze.", type: FileType.audio);

  // Initialize the audio player
  // await SimpleAudio.init();
  // final SimpleAudio player = SimpleAudio();
  
    if (result != null) {
        PlatformFile file = result.files.single;
        final File fileForFirebase = File(file.path!);

        final storage = FirebaseStorage.instance;
        final storageRef = storage.ref();

        final uploadTask = storageRef
        .child("audio/" + file.name!)
        .putFile(fileForFirebase);

      // // This works! It plays the audio file immediately after upload
      // // and also still shows the file path concurrently.
      // await player.stop();
      // await player.open(file.path!);
      // var request = http.MultipartRequest("POST", Uri.parse('http://10.216.216.153:5000/upload'));

      // request.files.add(http.MultipartFile.fromBytes(
      //   'audio',
      //   file.bytes!,
      //   filename: file.name,
      // ));

      // request.headers['Content-Type'] = 'multipart/form-data';

      // var response = await request.send();

      // if (response.statusCode == 200) {
      //   print("File uploaded successfully");
      // } else {
      //   print("Failed to upload file. Status code: ${response.statusCode}");
      // }
        appState.pressed = 0;

        return file;
      }
      else {
        // return a default file if none selected.
        PlatformFile file = PlatformFile(name: "default", size: 0);

        appState.pressed = 0;
        return file;
      }
  }
  PlatformFile file = PlatformFile(name: "default", size: 0);

  appState.pressed = 0;
  return file;
}