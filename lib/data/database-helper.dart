import 'dart:io';
import 'package:flutter_login/models/user.dart';
//import 'package:flutter_sqlite/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
//import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;
  final String tableUser = "User";

  final String columnFullName = "fullname";
  final String columnfirstName = "firstname";
  final String columnstoreName = "storename";
  final String columnbusinesstype = "businesstype";
  final String columnstore = "store";
  final String columnlicensenumber = "licensenumber";
  final String columnaddress = "address";
  final String columnnumber = "number";
  final String columnmail = "mail";
  final String columnpassword = "password";
  final String columnconfirmpass = "confirmpass";
  final String columnpayment = "payment";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY,$columnFullName TEXT,$columnfirstName TEXT,$columnstoreName TEXT,$columnbusinesstype TEXT,$columnstore TEXT,$columnlicensenumber TEXT,$columnaddress TEXT,$columnnumber TEXT,$columnmail TEXT,$columnpassword TEXT,$columnconfirmpass TEXT,$columnpayment TEXT)");
    print("Table is created");
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    print(user.mail);
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<User> selectUser(User user) async {
    print("Select User");
    print(user.mmail);
    print(user.mpassword);
    var dbClient = await db;

    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnFullName, columnfirstName,columnstoreName,columnbusinesstype,columnstore,columnlicensenumber
        ,columnaddress,columnnumber,columnmail,columnpassword,columnconfirmpass,columnpayment],
        where: "$columnmail = ? and $columnpassword = ?",
        whereArgs: [user.mmail, user.mpassword]);

    print(maps);
    if (maps.length > 0) {
      print("User Exist !!!");
      return User.map(maps.first);
    } else {
      return null;
    }
  }
}
