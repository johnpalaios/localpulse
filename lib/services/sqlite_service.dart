import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:localpulse/models/event.dart';


class SqliteService {
  static const String databaseName = "database.db";
  static Database? db;

  static Future<Database> initializeDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return db?? await openDatabase(
      path, 
      version: 1,       
      onOpen: (Database db) async {
        await createTables(db);
    });
  }
  static Future<void> createTables(Database db) async{
    await db.execute( 
           """
            CREATE TABLE IF NOT EXISTS events(id INTEGER IDENTITY(1,1) PRIMARY KEY,
                name TEXT, description TEXT, latitude TEXT, longitude TEXT,
                date DATE,time TIMESTAMP,userId INT);
            """
          );
          await db.execute( 
           """
            CREATE TABLE IF NOT EXISTS users(id INTEGER IDENTITY(1,1) PRIMARY KEY,
                email TEXT NOT NULL, full_name TEXT NOT NULL, password TEXT NOT NULL);
            """
          );
  }
  static Future<void> deleteTables(Database db) async{
    await db.execute( 
           """
            DROP TABLE events;
            """
          );
          await db.execute( 
           """
            DROP TABLE users;
            """
          );
  }
  static Future<void> insertEvent(Event event, BuildContext context) async {
    final db = await SqliteService.initializeDB();
    await db.insert(
      'events', event.toMap(context), 
      conflictAlgorithm: ConflictAlgorithm.replace);
   }

  static Future<List<Event>> getEvents(Database db) async {
    final db = await SqliteService.initializeDB();

    final List<Map<String, Object?>> queryResult = 
      await db.query('events');
    return queryResult.map((e) => Event.fromMap(e)).toList();
  }  
}
