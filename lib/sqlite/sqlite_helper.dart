import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static final String databaseName= "to_do.sqlite";

  static Future<Database> databaseConnection () async {
    String databasePath = join(await getDatabasesPath(), databaseName);

    if(await databaseExists(databasePath)){
      print("database available. no need to copy");
    }else{
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print("database is copy completed");
    }
    return openDatabase(databasePath);
  }
}