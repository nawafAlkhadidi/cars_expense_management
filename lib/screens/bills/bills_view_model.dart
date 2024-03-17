// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:cars_expense_management/core/modules/models/bill_models.dart';
import 'package:cars_expense_management/core/modules/repositories/bills_repositories.dart';
import 'package:cars_expense_management/core/modules/repositories/car_repositories.dart';
import 'package:cars_expense_management/library.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

final billsViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<BillsViewModel>());

class BillsViewModel extends ChangeNotifier {
  final BillsRepositories billsRepositories;
  final CarRepositories carsRepositories;
  // constructor
  BillsViewModel(this.billsRepositories, this.carsRepositories);

  TextEditingController dataController = TextEditingController();
  TextEditingController carNameController = TextEditingController();
  TextEditingController carOdometerController = TextEditingController();
  TextEditingController carCurrentOdometerController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int index = 0;
  BillModels bills = BillModels();
  void setIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  dateRangePickerDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            // actionsAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            insetPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 450,
              width: 450,
              child: SfDateRangePicker(
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) => _onSelectionChanged(dateRangePickerSelectionChangedArgs, context),
                selectionMode: DateRangePickerSelectionMode.single,
                headerStyle: const DateRangePickerHeaderStyle(textStyle: TextStyle(fontSize: 22, color: Colors.black)),
                yearCellStyle: DateRangePickerYearCellStyle(
                    textStyle: Theme.of(context).textTheme.bodyLarge, todayTextStyle: const TextStyle(fontSize: 16, color: Colors.deepPurple)),
                rangeTextStyle: const TextStyle(color: Colors.red),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                  // selectionTextStyle: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
                  // blackoutDateTextStyle: const TextStyle(color: Colors.red, fontSize: 20),
                  // rangeTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  // leadingDatesTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  // specialDatesTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  // disabledDatesTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  // trailingDatesTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  // selectionTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  textStyle: TextStyle(color: Colors.black, fontSize: 18),
                  todayTextStyle: TextStyle(color: Colors.deepPurple, fontSize: 18),
                  weekendTextStyle: TextStyle(color: Colors.black, fontSize: 18),
                  // blackoutDateTextStyle:
                ),
                selectionTextStyle: const TextStyle(color: Colors.white, fontSize: 20),

                // initialSelectedRange: PickerDateRange(DateTime.now().subtract(const Duration(days: 4)), DateTime.now().add(const Duration(days: 3))),
              ),
            )).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
      },
    );
  }

  _onSelectionChanged(DateRangePickerSelectionChangedArgs data, BuildContext context) {
    dataController.text = DateFormat('yyyy/MM/dd').format((data.value));
    Navigator.pop(context);
  }

  claer() {
    dataController.clear();
  }

  Widget getScreen(int index) {
    switch (index) {
      case 1:
        return const AddBillScreen();
      default:
        return const BillScreen();
    }
  }

  void addbill({required BuildContext context}) async {
    if (globalKey.currentState!.validate()) {
      bills.price = priceController.value.text;
      bills.details = detailsController.value.text;
      bills.personName = nameController.value.text;
      bills.createdAt = dataController.value.text;
      bills.distance = distanceController.value.text;
      bills.currentOdometer = carCurrentOdometerController.value.text;
      bills.previousOdometer = carOdometerController.value.text;
      bills.carId = carNameController.value.text;

      // bool status = await carRepositories.addNewBills(bills);
      // if (status) {
      //   Navigator.pop(context);
      // setIndex(0)
      // }
    }
  }
}
