import 'dart:io';
import 'package:taaki/fileHelper.dart';

class ReportWriter {
  FileHelper _fileHelper = new FileHelper();

  void write(data) async {
    final file = await _fileHelper.getFile;
    file.writeAsString(data + '\n', mode: FileMode.append, flush: true);
  }
}
