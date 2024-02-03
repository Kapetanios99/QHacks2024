import 'package:file_picker/file_picker.dart';


Future<PlatformFile> uploadAudio() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    return file;
  } else {
    PlatformFile file = PlatformFile(name: "default", size: 0);

    return file;
  }
}