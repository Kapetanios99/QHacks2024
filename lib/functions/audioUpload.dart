/*
  This asynchronous function opens the file picker, allowing the user
  to pick an audio file. The audio file is then played, and an instance
  of the PlatformFile class with info on the newly cahced file is returned.
*/

import 'package:file_picker/file_picker.dart';
// import 'package:simple_audio/simple_audio.dart';

Future<PlatformFile> uploadAudio() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(dialogTitle: "Pick file to analyze.", type: FileType.audio);

  // Initialize the audio player
  // await SimpleAudio.init();
  // final SimpleAudio player = SimpleAudio();

  if (result != null) {
    PlatformFile file = result.files.single;

    // // This works! It plays the audio file immediately after upload
    // // and also still shows the file path concurrently.
    // await player.stop();
    // await player.open(file.path!);

    return file;
  } else {
    // return a default file if none selected.
    PlatformFile file = PlatformFile(name: "default", size: 0);

    return file;
  }
}