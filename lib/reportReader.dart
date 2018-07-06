import 'dart:async';
import 'package:taaki/fileHelper.dart';

class ReportReader {
  FileHelper _fileHelper = new FileHelper();

  Future<String> read() async {
    final file = await _fileHelper.getFile;
    var exist = await file.exists();
    if (!exist) {
      return "";
    }
    return file.readAsString();
  }
}
