
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ReportWriter {

  void write(data) async {
    final file = await _localFile;
    file.writeAsString(data + '\n', mode: FileMode.append, flush: true);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final currDate = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(currDate);
    return File('$path/attendace_$formatted.tab');
  }
}