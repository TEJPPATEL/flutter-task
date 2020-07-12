import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:registrationDemo/models/registration.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String registrationTable = "Registration_Table";
  String colId = "id";
  String colName = "name";
  String colAddress = "address";
  String colState = "state";
  String colCountry = "country";
  String colHobby = "hobby";
  String colDob = "dob";
  String colImage = "image";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path  + 'registration.db';
    var noteDatabase = openDatabase(path,version: 1 , onCreate: _createDb);
    return noteDatabase;

  }

  Future<Database> get database async {
    if(_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }




  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $registrationTable($colId INTEGER PRIMARY KEY AUTOINCREMENT , $colName TEXT,$colAddress TEXT, $colState TEXT,$colCountry TEXT , $colHobby TEXT, $colDob TEXT , $colImage TEXT)');
  }


  getRegistrationMapList() async {
     Database db = await this.database;
    //  var result = await db.rawQuery('SELECT * FROM $registrationTable order by $colName ASC');
    var result = await db.query(registrationTable,orderBy:'$colName ASC');
    return result;
  }

  Future<int> insertUser(Registration registration) async {
    Database db = await this.database;
    var result = await db.insert(registrationTable, registration.toMap());
    return result;
  }

  Future<int> updateUser(Registration registration) async {
    var db = await this.database;
    var result = await db.update(registrationTable, registration.toMap() , where: '$colId = ?' ,whereArgs: [ registration.getId()]);
    return result;
  }

  Future<int> deleteUser(Registration registration)async {
    var db = await this.database;
    var result = await db.rawDelete('DELETE FROM $registrationTable WHERE $colId = $registration.id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT(*) FROM $registrationTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }






}
