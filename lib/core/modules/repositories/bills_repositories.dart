import 'package:cars_expense_management/library.dart';

class BillsRepositories {
  final DatabaseService databaseService;

  BillsRepositories(this.databaseService);

  Future<List<BillModels>> getAllBills() async {
    List<BillModels> bills = [];

    Database db = await databaseService.database;
    List<Map<String, dynamic>> billsData = await db.rawQuery('''
    SELECT bills.*, cars.*, types_of_expense.*
    FROM bills
    JOIN cars ON cars.id = bills.car_id
    JOIN types_of_expense ON types_of_expense.id = bills.expense_id
  ''');
    for (var bill in billsData) {
      bills.add(BillModels.fromJson(bill));
    }

    return bills;
  }

  Future<bool> addNewBills(BillModels newBill) async {
    Database db = await databaseService.database;
    await db.insert('bills', newBill.toMap());
    return true;
  }

  Future<bool> deleteBills(int newBill) async {
    Database db = await databaseService.database;
    await db.delete('bills', where: 'id = ?', whereArgs: [newBill]);
    return true;
  }
}
