import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:project1/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper {
   static Database? _db;

   ///Tên database
  static const String DB_Name = 'test.db';

  ///Tên bảng
  static const String Table_User = 'user';
  static const int Version = 1;


  ///Tên của column (các thuộc tính trong bảng)
   static const int C_UserID = 1;
  static const String C_UserName = 'user_name';
  static const String C_IdNumber = 'id_number';
  static const String C_PhoneNumber = 'phone_number';
  static const String C_Password = 'password';


  ///Hàm Database (DB)
  static Future<Database?> get db async {

    if (_db != null) {
      return _db;
    }
    _db =  await initDb();
    return _db;
  }

  static Future<Database?> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

   static Future<void> _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID INTEGER, "
        " $C_UserName TEXT, "
        " $C_IdNumber TEXT, "
        " $C_PhoneNumber TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
  }

 static Future<int?> saveData(UserModel user) async {
    var dbClient = await db;
    int? userId = await dbClient?.insert(Table_User, user.toMap());
    return userId;
  }

  Future<UserModel?> getLoginUser(String phoneNumber) async {
    var dbClient = await db;
    var res = await dbClient?.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_PhoneNumber = '$phoneNumber'");

    if (res?.isNotEmpty ?? false) {
      return UserModel.fromMap(res!.first);
    }

    return null;
  }

  static Future<void> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient?.update(Table_User, user.toMap(),
        where: '$C_UserID = ?', whereArgs: [user.user_id]);
    print(res);
    print(user.user_id);
  }

  Future<UserModel?> getUserById(int userId) async {
     var dbClient = await db;
     var res = await dbClient?.rawQuery("SELECT * FROM $Table_User WHERE "
         "$C_UserID = '$userId'");

     if (res?.isNotEmpty ?? false) {
       return UserModel.fromMap(res!.first);
     }

     return null;
   }


  // Future<int> deleteUser(String user_id) async {
  //   var dbClient = await db;
  //   var res = await dbClient
  //       .delete(Table_User, where: '$C_UserID = ?', whereArgs: [user_id]);
  //   return res;
  // }
}

