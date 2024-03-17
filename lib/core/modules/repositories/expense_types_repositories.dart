import 'package:cars_expense_management/library.dart';

class ExpenseTypesRepositories {
  final DatabaseService databaseService;

  ExpenseTypesRepositories(this.databaseService);

  Future<List<TypeOfExpenseModels>> getAllExpense() async {
    List<TypeOfExpenseModels> expenses = [];
    Database db = await databaseService.database;
    List<Map<String, dynamic>> expenseData = await db.query('types_of_expense');
    for (var expense in expenseData) {
      expenses.add(TypeOfExpenseModels.fromJson(expense));
    }
    return expenses;
  }

  Future<bool> addNewType(TypeOfExpenseModels newType) async {
    Database db = await databaseService.database;
    await db.insert('types_of_expense', newType.toMap()).then((value) => null);
    return true;
  }

  Future<bool> deleteType(int typeID) async {
    Database db = await databaseService.database;
    await db.delete('types_of_expense', where: 'id = ?', whereArgs: [typeID]);
    return true;
  }

  Future<bool> upadteType(int typeID, TypeOfExpenseModels newType) async {
    Database db = await databaseService.database;
    await db.update('types_of_expense', newType.toMap(), where: 'id = ?', whereArgs: [typeID]);
    return true;
  }
}
