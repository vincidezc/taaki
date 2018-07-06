import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class FileHelper {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<String> get filePath async {
    final path = await _localPath;
    final currDate = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(currDate);
    return '$path/attendace_$formatted.tab';
  }

  Future<File> get getFile async {
    return await File(await filePath);
  }
}
