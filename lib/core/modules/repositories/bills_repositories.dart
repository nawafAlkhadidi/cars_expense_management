import 'package:cars_expense_management/core/modules/models/summary_model.dart';
import 'package:cars_expense_management/core/modules/models/total_bills_models.dart';
import 'package:cars_expense_management/core/modules/models/weekly_summary_model.dart';
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
      // print(bill);
      bills.add(BillModels.fromJson(bill));
    }

    return bills;
  }

  Future<List<TotalBillsModels>> getTotalbillsAnnual(String date) async {
    List<TotalBillsModels> bills = [];
    Database db = await databaseService.database;
    List<Map<String, dynamic>> billsData = await db.rawQuery('''
  SELECT strftime('%Y-%m', datetime(created_at, 'localtime')) AS month,
         SUM(price) AS total_price,
         strftime('%m', datetime(created_at, 'localtime')) AS month_number
  FROM bills
  WHERE created_at IS NOT NULL
    AND strftime('%Y', datetime(created_at, 'localtime')) = '$date'
  GROUP BY month
''');
    for (var bill in billsData) {
      bills.add(TotalBillsModels.fromJson(bill));
    }

    return bills;
  }

  Future<List<WeeklySummaryModel>> getTotalbillsWeekly() async {
    List<WeeklySummaryModel> days = [];
    Database db = await databaseService.database;
    DateTime now = DateTime.now();
    DateTime startOfWeek = DateTime(now.year, now.month, now.day);

    for (int i = 0; i < 7; i++) {
      DateTime currentDate = startOfWeek.add(Duration(days: i));
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      String dayOfWeek = DateFormat('EEEE').format(currentDate); // Format as the name of the day
      List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT 
        '$dayOfWeek' AS day,
        IFNULL(SUM(price), 0) AS total_price_bills
      FROM bills
      WHERE DATE(created_at) = '$formattedDate' ''');
      days.add(WeeklySummaryModel(
        day: result.first["day"],
        totalPriceBills: double.tryParse(result.first["total_price_bills"].toString()),
      ));
    }

    return days;
  }

  Future<SummaryModel> getSummary() async {
    SummaryModel summary = SummaryModel();

    Database db = await databaseService.database;
    List<Map<String, dynamic>> billsData = await db.rawQuery('''
   SELECT 
    (SELECT COUNT(*) FROM cars) AS total_cars,
    (SELECT COUNT(*) FROM bills) AS total_bills,
    (SELECT COUNT(*) FROM types_of_expense) AS total_expense_types,
    (SELECT SUM(price) FROM bills) AS total_price ''');
    summary = SummaryModel.fromJson(billsData.first);
    return summary;
  }

//
  Future<bool> addNewBills(BillModels newBill) async {
    Database db = await databaseService.database;
    await db.insert('bills', newBill.toMap());
    return true;
  }

  Future<bool> deleteBills(int bill) async {
    Database db = await databaseService.database;
    await db.delete('bills', where: 'bill_id = ?', whereArgs: [bill]);
    return true;
  }
}
