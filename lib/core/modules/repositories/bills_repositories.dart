import 'package:cars_expense_management/core/modules/models/bill_models.dart';
import 'package:cars_expense_management/library.dart';

class BillsRepositories {
  final DatabaseService databaseService;

  BillsRepositories(this.databaseService);

  Future<List<BillModels>> getAllBills() async {
    List<BillModels> bills = [];
    Database db = await databaseService.database;
    List<Map<String, dynamic>> billsData = await db.query('bills');
    for (var bill in billsData) {
      bills.add(BillModels.fromJson(bill));
    }
    return bills;
  }

  Future<bool> addNewBills(BillModels newBill) async {
    Database db = await databaseService.database;
    await db.insert('bills', newBill.toMap()).then((value) => null);
    return true;
  }

  Future<bool> deleteBills(int newBill) async {
    Database db = await databaseService.database;
    await db.delete('bills', where: 'id = ?', whereArgs: [newBill]);
    return true;
  }
}
