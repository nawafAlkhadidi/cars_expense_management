// ignore_for_file: use_build_context_synchronously

import 'package:cars_expense_management/library.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:collection/collection.dart';

final carViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<CarViewModel>());

class CarViewModel extends ChangeNotifier {
  final CarRepositories carRepositories;
  final CarDataSource carDataSource;
  // constructor
  CarViewModel(this.carRepositories, this.carDataSource) {
    getCars();
  }

  List<CarModel> cars = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  CarModel newCar = CarModel();
  int indexPage = 0;

  TextEditingController? carIdController,
      plateNumbersController,
      plateLettersController,
      typeOfCarController,
      vinController,
      currentOdometerController,
      carModelController;

  void setIndexPage(int newIndex) {
    indexPage = newIndex;
    notifyListeners();
  }

  void initController() {
    carIdController = TextEditingController();
    plateNumbersController = TextEditingController();
    typeOfCarController = TextEditingController();
    vinController = TextEditingController();
    currentOdometerController = TextEditingController();
    plateLettersController = TextEditingController();
    carModelController = TextEditingController();
  }

  Widget getScreen(int index) {
    switch (index) {
      case 1:
        return const AddCarScreen();
      default:
        return const CarsScreen();
    }
  }

  void setDataTable() {
    carDataSource.setCars(cars);
    carDataSource.buildDataGridRows();
    notifyListeners();
  }

  void getCars() async {
    cars.clear();
    cars = await carRepositories.getCars();
    setDataTable();
  }

  BoxDecoration drawBorder() {
    final BorderSide borderSide = BorderSide(color: Colors.grey.withOpacity(0.3));
    return BoxDecoration(border: Border(left: borderSide, right: borderSide, bottom: borderSide));
  }

  void deleteTheCar({required DataGridRow row, required BuildContext context}) async {
    final int index = carDataSource.dataGridRows.indexOf(row);
    bool status = await carRepositories.deleteTheCar(carDataSource.cars[index].id!);
    if (status) {
      final int index = carDataSource.dataGridRows.indexOf(row);
      carDataSource.dataGridRows.remove(row);
      carDataSource.cars.remove(carDataSource.cars[index]);
      carDataSource.updateDataSource();
      notifyListeners();
      Navigator.pop(context);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actions: <Widget>[TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          content: const Text('تم حذف السيارة بنجاح'),
        ),
      );
    }
  }

  Widget buildStartSwipeWidget(BuildContext context, DataGridRow row, int rowIndex) {
    return GestureDetector(
      onTap: () => _handleEditWidgetTap(row, context),
      child: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.edit, color: Colors.white, size: 20),
            SizedBox(width: 16.0),
            Text(
              'تعديل',
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  void addcar({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      newCar.plateNumbers = int.tryParse(plateNumbersController!.value.text);
      newCar.plateLetters = plateLettersController!.value.text;
      newCar.vin = vinController!.value.text;
      newCar.carModel = int.tryParse(carModelController!.value.text);
      newCar.typeOfCar = typeOfCarController!.value.text;
      newCar.currentOdometer = int.tryParse(currentOdometerController!.value.text);
      bool status = await carRepositories.addcar(newCar);
      if (status) {
        setIndexPage(1);
      }
    }
  }

  Widget buildEndSwipeWidget(BuildContext context, DataGridRow row, int rowIndex) {
    return GestureDetector(
      onTap: () => _handleDeleteWidgetTap(row: row, context: context),
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white, size: 20),
            SizedBox(width: 16.0),
            Text(
              'حذف',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  void _updateTextFieldContext(DataGridRow row) {
    initController();
    final String? carId = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'id')?.value.toString();
    carIdController!.text = carId ?? "";
    final String? plateNumbers = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'plateNumbers')?.value.toString();
    plateNumbersController!.text = plateNumbers ?? '';
    final String? plateLetters = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'plateLetters')?.value.toString();
    plateLettersController!.text = plateLetters ?? '';
    final String? vin = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'vin')?.value;
    vinController!.text = vin ?? '';
    final String? typeOfCar = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'typeOfCar')?.value.toString();
    typeOfCarController!.text = typeOfCar ?? '';
    final String? carModel = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'carModel')?.value.toString();
    carModelController!.text = carModel ?? '';
    final String? currentOdometer = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'currentOdometer')?.value.toString();
    currentOdometerController!.text = currentOdometer ?? '';
  }

  void _processCellUpdate(DataGridRow row, BuildContext buildContext) async {
    if (_formKey.currentState!.validate()) {
      newCar.id = int.tryParse(carIdController!.value.text);
      newCar.plateNumbers = int.tryParse(plateNumbersController!.value.text);
      newCar.plateLetters = plateLettersController!.value.text;
      newCar.vin = vinController!.value.text;
      newCar.carModel = int.tryParse(carModelController!.value.text);
      newCar.typeOfCar = typeOfCarController!.value.text;
      newCar.currentOdometer = int.tryParse(currentOdometerController!.value.text);

      bool status = await carRepositories.upadteTheCar(newCar.id!, newCar);
      if (status) {
        final int rowIndex = carDataSource.rows.indexOf(row);
        carDataSource.rows[rowIndex] = DataGridRow(cells: [
          DataGridCell<int>(columnName: 'id', value: newCar.id),
          DataGridCell<int>(columnName: 'plateNumbers', value: newCar.plateNumbers),
          DataGridCell<String>(columnName: 'plateLetters', value: newCar.plateLetters),
          DataGridCell<String>(columnName: 'vin', value: newCar.vin),
          DataGridCell<int>(columnName: 'carModel', value: newCar.carModel),
          DataGridCell<String>(columnName: 'typeOfCar', value: newCar.typeOfCar),
          DataGridCell<int>(columnName: 'currentOdometer', value: newCar.currentOdometer),
        ]);
        // carDataSource.buildDataGridRows();
        carDataSource.updateDataSource();
        Navigator.pop(buildContext);

        notifyListeners();
      }
    }
  }

  List<Widget> _buildActionButtons(DataGridRow row, BuildContext buildContext) {
    return <Widget>[
      TextButton(
          onPressed: () => _processCellUpdate(row, buildContext),
          child: const Text('حفظ', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16))),
      TextButton(
          onPressed: () => Navigator.pop(buildContext),
          child: const Text('إلغاء', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)))
    ];
  }

  Widget _buildRow(
      {required TextEditingController controller, required String columnName, required TextInputFormatter filteringTextInput, required int length}) {
    final TextInputType keyboardType = filteringTextInput == FilteringTextInputFormatter.digitsOnly ? TextInputType.number : TextInputType.text;

    return Row(
      children: <Widget>[
        Container(width: 150, padding: const EdgeInsets.symmetric(vertical: 15), child: Text(columnName)),
        SizedBox(
          width: 150,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "يجب ألا يكون الحقل فارغًا";
              }
              if (value.length > length) {
                return "الحدد المسموح $length";
              }
              return null;
            },
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: <TextInputFormatter>[filteringTextInput],
          ),
        )
      ],
    );
  }

  Widget _buildAlertDialogContent() {
    return Column(
      children: <Widget>[
        _buildRow(controller: plateNumbersController!, columnName: 'أرقام اللوحة', filteringTextInput: FilteringTextInputFormatter.digitsOnly, length: 4),
        _buildRow(
            controller: plateLettersController!, columnName: 'حروف اللوحة', filteringTextInput: FilteringTextInputFormatter.deny(RegExp(r'\d')), length: 5),
        _buildRow(
            controller: vinController!, columnName: 'رقم الهيكل', filteringTextInput: FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')), length: 40),
        _buildRow(controller: typeOfCarController!, columnName: 'نوع السيارة', filteringTextInput: FilteringTextInputFormatter.deny(RegExp(r'\d')), length: 10),
        _buildRow(controller: carModelController!, columnName: 'موديل السيارة', filteringTextInput: FilteringTextInputFormatter.digitsOnly, length: 4),
        _buildRow(controller: currentOdometerController!, columnName: 'عداد المسافة', filteringTextInput: FilteringTextInputFormatter.digitsOnly, length: 40)
      ],
    );
  }

  /// Editing the DataGridRow
  void _handleEditWidgetTap(DataGridRow row, BuildContext context) {
    _updateTextFieldContext(row);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        scrollable: true,
        alignment: Alignment.center,
        title: const Center(child: Text('تعديل السيارة', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
        actions: _buildActionButtons(row, context),
        content: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Form(
              key: _formKey,
              child: _buildAlertDialogContent(),
            ),
          ),
        ),
      ),
    );
  }

  _handleDeleteWidgetTap({required BuildContext context, required DataGridRow row}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          actionsPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
          contentPadding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
          title: const Text('هل تريد حذف السيارة ؟', style: TextStyle(fontSize: 18, color: Colors.red)),
          content:
              const Text('سيتم حذف بيانات السيارة بشكل كامل متأكد بتحذفها ؟', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
          actions: <Widget>[
            GFButton(
                size: 40,
                fullWidthButton: false,
                onPressed: () => Navigator.pop(context),
                text: "تراجع",
                textStyle: const TextStyle(fontSize: 13, fontFamily: "Tajawal"),
                shape: GFButtonShape.pills,
                color: Colors.blueGrey),
            GFButton(
                size: 40,
                fullWidthButton: false,
                onPressed: () => deleteTheCar(row: row, context: context),
                text: "حذف",
                textStyle: const TextStyle(fontSize: 13, fontFamily: "Tajawal"),
                shape: GFButtonShape.pills,
                color: Colors.red),
          ],
        );
      },
    );
  }
}
