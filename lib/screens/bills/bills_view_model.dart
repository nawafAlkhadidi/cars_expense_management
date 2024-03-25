// ignore_for_file: use_build_context_synchronously,
import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/bills/data_source/bills_data_source.dart';
import 'package:cars_expense_management/widgets/date_range_picker.dart';
import 'package:collection/collection.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart' show DateFormat;

final billsViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<BillsViewModel>());

class BillsViewModel extends ChangeNotifier {
  final BillsRepositories billsRepositories;
  final CarRepositories carRepositories;
  final BillDataSource billDataSource;
  BillsViewModel(this.billsRepositories, this.carRepositories, this.billDataSource) {
    getBills();
  }

  TextEditingController? dataController,
      carNameController,
      lastOdometerController,
      newOdometerController,
      distanceController,
      priceController,
      nameController,
      detailsController,
      expenseController;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int indexPage = 0;
  BillModels bill = BillModels();
  List<BillModels> billsList = [];
  CarModel car = CarModel();
  TypeOfExpenseModels expenseType = TypeOfExpenseModels();
  List<CarModel> cars = [];

  void setIndex(int newIndex) {
    indexPage = newIndex;
    notifyListeners();
  }

  Widget getScreen(int index) {
    switch (index) {
      case 1:
        return const AddBillScreen();
      default:
        return const BillsScreen();
    }
  }

  void initController() {
    dataController = TextEditingController();
    carNameController = TextEditingController();
    lastOdometerController = TextEditingController();
    newOdometerController = TextEditingController();
    distanceController = TextEditingController();
    priceController = TextEditingController();
    nameController = TextEditingController();
    detailsController = TextEditingController();
    expenseController = TextEditingController();
  }

  void getBills() async {
    billsList.clear();
    billsList = await billsRepositories.getAllBills();
    setDataTable();
  }

  void setDataTable() {
    billDataSource.setBills(billsList);
    billDataSource.buildDataGridRows();
    notifyListeners();
  }

  exportDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            insetPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 350,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: GFButton(
                    size: 50,
                    fullWidthButton: true,
                    onPressed: () => null,
                    text: "PDF",
                    textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                    shape: GFButtonShape.standard,
                    color: AppBrand.drawerButtonColor,
                  )),
                  SizedBox(width: 20, height: 20),
                  Flexible(
                      child: GFButton(
                    size: 50,
                    fullWidthButton: true,
                    onPressed: () => null,
                    text: "Excel",
                    textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                    shape: GFButtonShape.standard,
                    color: AppBrand.drawerButtonColor,
                  )),
                ],
              ),
            )).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
      },
    );
  }

  dateRangePickerDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            insetPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 450,
              width: 450,
              child: CustomDateRangePicker(onSelectionChanged: _onSelectionChanged),
            )).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
      },
    );
  }

  carsPickerDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            insetPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(top: 30, right: 20), child: Text("أختر السيارة من القائمة التالية :", style: TextStyle(fontSize: 19))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    height: 450,
                    width: 450,
                    child: FutureBuilder<List<CarModel>>(
                        future: carRepositories.getCars(),
                        builder: (context, dataSnapshot) {
                          if (dataSnapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: dataSnapshot.data?.length ?? 0,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: false,
                              itemBuilder: (_, index) => ListTile(
                                    onTap: () {
                                      selectCar(selectedCar: dataSnapshot.data![index]);
                                      Navigator.pop(context);
                                    },
                                    leading: CircleAvatar(backgroundColor: AppBrand.drawerButtonColor, child: Text(dataSnapshot.data![index].id.toString())),
                                    title: Text(
                                        "${dataSnapshot.data![index].typeOfCar!} | ${dataSnapshot.data![index].plateNumbers!} | ${dataSnapshot.data![index].plateLetters.toString()}"),
                                    subtitle: Text(dataSnapshot.data![index].vin.toString()),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                  ));
                        })),
              ],
            )).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
      },
    );
  }

  BoxDecoration drawBorder() {
    final BorderSide borderSide = BorderSide(color: Colors.grey.withOpacity(0.3));
    return BoxDecoration(border: Border(left: borderSide, right: borderSide, bottom: borderSide));
  }

  expensePickerDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 30, right: 20), child: Text("أختر نوع المصروف من القائمة التالية :", style: TextStyle(fontSize: 19))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    height: 450,
                    width: 450,
                    child: FutureBuilder(
                        future: locator<ExpenseTypesRepositories>().getAllExpense(),
                        builder: (context, dataSnapshot) {
                          if (dataSnapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: dataSnapshot.data?.length ?? 0,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: false,
                              itemBuilder: (_, index) => ListTile(
                                    onTap: () {
                                      selectExpense(selectedExpense: dataSnapshot.data![index]);
                                      Navigator.pop(context);
                                    },
                                    leading: CircleAvatar(backgroundColor: AppBrand.drawerButtonColor, child: Text(dataSnapshot.data![index].id.toString())),
                                    title: Text(dataSnapshot.data![index].name!, style: const TextStyle(fontSize: 20)),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                  ));
                        })),
              ],
            )).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
      },
    );
  }

  void selectExpense({TypeOfExpenseModels? selectedExpense}) {
    expenseType = selectedExpense!;
    expenseController?.text = selectedExpense.name ?? "";
  }

  selectCar({CarModel? selectedCar}) {
    car = selectedCar!;
    carNameController?.text = "${car.typeOfCar!} | ${car.plateNumbers!} | ${car.plateLetters.toString()}";
    lastOdometerController?.text = car.lastOdometer.toString();
  }

  _onSelectionChanged(DateRangePickerSelectionChangedArgs data, BuildContext context) {
    dataController?.text = DateFormat('yyyy/MM/dd').format((data.value));
    Navigator.pop(context);
  }

  calculateODM(String newValue) {
    int? newODM = int.tryParse(newOdometerController!.value.text);
    int? lastODM = int.tryParse(lastOdometerController!.value.text);
    String distance = (newODM! - lastODM!).toString();
    distanceController?.text = distance;
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
          title: const Text('هل تريد حذف الفاتورة ؟', style: TextStyle(fontSize: 18, color: Colors.red)),
          content: const Text('سيتم حذف الفاتورة بشكل كامل متأكد بتحذفها ؟', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
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
                onPressed: () => deleteThebill(row: row, context: context),
                text: "حذف",
                textStyle: const TextStyle(fontSize: 13, fontFamily: "Tajawal"),
                shape: GFButtonShape.pills,
                color: Colors.red),
          ],
        );
      },
    );
  }

  void deleteThebill({required DataGridRow row, required BuildContext context}) async {
    final int index = billDataSource.dataGridRows.indexOf(row);
    bool status = await billsRepositories.deleteBills(billDataSource.bills[index].id!);
    if (status) {
      final int index = billDataSource.dataGridRows.indexOf(row);
      billDataSource.dataGridRows.remove(row);
      billDataSource.bills.remove(billDataSource.bills[index]);
      billDataSource.updateDataSource();
      notifyListeners();
      Navigator.pop(context);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actions: <Widget>[TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          content: const Text('تم حذف الفاتورة بنجاح'),
        ),
      );
    }
  }

  void addbill({required BuildContext context}) async {
    if (globalKey.currentState!.validate()) {
      bill.createdAt = dataController?.value.text;
      bill.carId = car.id!;
      bill.previousOdometer = int.tryParse(lastOdometerController!.value.text);
      bill.newOdometer = int.tryParse(newOdometerController!.value.text);
      bill.distance = int.tryParse(distanceController!.value.text);
      bill.expenseId = expenseType.id!;
      bill.personName = nameController?.value.text;
      bill.price = double.tryParse(priceController!.value.text);
      bill.details = detailsController?.value.text;

      bool status = await billsRepositories.addNewBills(bill);
      if (status) {
        bool isUpdate = await carRepositories.upadteODM(carID: car.id, newOdometer: int.tryParse(newOdometerController!.value.text)!);
        if (isUpdate) {
          getBills();
          setIndex(0);
        }
      }
    }
  }
}
