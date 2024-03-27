import 'package:cars_expense_management/library.dart';

class BillDataSource extends DataGridSource {
  BillDataSource();

  @override
  Future<void> handleRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 5));
    // orders = getOrders(orders, 15);
    buildDataGridRows();
    notifyListeners();
  }

  void buildDataGridRows() {
    dataGridRows = bills.map<DataGridRow>((BillModels bills) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<int>(columnName: 'id', value: bills.id),
        DataGridCell<String>(columnName: 'date', value: bills.createdAt),
        DataGridCell<String>(columnName: 'car', value: "${bills.typeOfCar} | ${bills.plateNumbers} | ${bills.plateLetters}"),
        DataGridCell<String>(columnName: 'expenseName', value: bills.expenseName),
        DataGridCell<String>(columnName: 'price', value: "${bills.price} ريال"),
        DataGridCell<String>(columnName: 'details', value: bills.details),
        DataGridCell<String>(columnName: 'personName', value: bills.personName),
        DataGridCell<int>(columnName: 'previousOdometer', value: bills.previousOdometer),
        DataGridCell<int>(columnName: 'newOdometer', value: bills.newOdometer),
        DataGridCell<int>(columnName: 'distance', value: bills.distance),

        // DataGridCell<int>(columnName: 'lastOdometer', value: bills.lastOdometer),
      ]);
      // }
    }).toList();
  }

  /// Update DataSource
  void updateDataSource() {
    notifyListeners();
  }

  void setBills(List<BillModels> newBills) {
    bills = newBills;
    updateDataSource();
  }

  List<BillModels> bills = [];
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = dataGridRows.indexOf(row);
    Color backgroundColor = Colors.transparent;
    if ((rowIndex % 2) == 0) {
      backgroundColor = AppBrand.tableHeaderColor.withOpacity(0.2);
    }
    return DataGridRowAdapter(
        color: backgroundColor,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            // color: Colors.white,
            // alignment: dataGridCell.columnName == 'id' ? Alignment.center : Alignment.center,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dataGridCell.value.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Tajawal"),
            ),
          );
        }).toList());
  }
}
