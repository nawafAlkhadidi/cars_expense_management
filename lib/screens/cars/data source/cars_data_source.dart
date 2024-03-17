import 'package:cars_expense_management/library.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CarDataSource extends DataGridSource {
  CarDataSource() {
    // {required List<CarModel> newcars}
    // cars = newcars;

    // buildDataGridRows();
  }

  @override
  Future<void> handleRefresh() async {
    print("handleRefresh");
    await Future<void>.delayed(const Duration(seconds: 5));
    // orders = getOrders(orders, 15);
    buildDataGridRows();
    notifyListeners();
  }

  void buildDataGridRows() {
    dataGridRows = cars.map<DataGridRow>((CarModel car) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<int>(columnName: 'id', value: car.id),
        DataGridCell<int>(columnName: 'plateNumbers', value: car.plateNumbers),
        DataGridCell<String>(columnName: 'plateLetters', value: car.plateLetters),
        DataGridCell<String>(columnName: 'vin', value: car.vin),
        DataGridCell<String>(columnName: 'typeOfCar', value: car.typeOfCar),
        DataGridCell<int>(columnName: 'carModel', value: car.carModel),
        DataGridCell<int>(columnName: 'currentOdometer', value: car.currentOdometer),
      ]);
      // }
    }).toList();
  }

  /// Update DataSource
  void updateDataSource() {
    notifyListeners();
  }

  void setCars(List<CarModel> newCars) {
    cars = newCars;
    updateDataSource();
  }

  List<CarModel> cars = [];
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
