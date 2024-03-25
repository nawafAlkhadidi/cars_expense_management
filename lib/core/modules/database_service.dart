import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'your_database12_name.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cars (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            plateNumbers INTEGER,
            plateLetters TEXT,
            vin TEXT,
            carModel INTEGER,
            lastOdometer INTEGER,
            typeOfCar TEXT
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
          )
        ''');
        await db.execute('''
          CREATE TABLE types_of_expense (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            expenseName TEXT
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
          )
        ''');
        await db.execute('''
          CREATE TABLE bills (
            bill_id INTEGER PRIMARY KEY AUTOINCREMENT,
            car_id INTEGER,
            expense_id INTEGER,
            price double,
            details TEXT,
            person_name TEXT,
            new_odometer INTEGER,
            previous_odometer INTEGER,
            distance INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (car_id) REFERENCES cars (id),
            FOREIGN KEY (expense_id) REFERENCES types_of_expense (id)
          )
        ''');
      },
      version: 1,
    );
  }
}
// details  person_name