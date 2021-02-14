import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName.txt');
  }

  Future<File> saveToFile({String contents, String fileName}) async {
    final file = await _localFile(fileName);
    // Write the file
    return file.writeAsString('$contents');
  }

  Future<String> readFromFile({String fileName}) async {
    try {
      final file = await _localFile(fileName);
      // Read the file
      var contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'file read error: ${e.toString()}';
    }
  }
}
