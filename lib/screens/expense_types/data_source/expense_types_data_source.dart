import 'package:cars_expense_management/library.dart';

class ExpensesDataSource extends DataGridSource {
  ExpensesDataSource();

  @override
  Future<void> handleRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 5));
    buildDataGridRows();
    notifyListeners();
  }

  void buildDataGridRows() {
    dataGridRows = expensesList.map<DataGridRow>((TypeOfExpenseModels type) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<int>(columnName: 'id', value: type.id),
        DataGridCell<String>(columnName: 'name', value: type.name),
      ]);
      // }
    }).toList();
  }

  /// Update DataSource
  void updateDataSource() {
    notifyListeners();
  }

  void setExpenses(List<TypeOfExpenseModels> newType) {
    expensesList = newType;
    updateDataSource();
  }

  List<TypeOfExpenseModels> expensesList = [];
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
