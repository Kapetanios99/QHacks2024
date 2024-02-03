import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<PlatformFile> uploadAudio() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  
  if (result != null) {
      PlatformFile file = result.files.first;
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


    return file;
  } else {
    PlatformFile file = PlatformFile(name: "default", size: 0);

    return file;
  }
}