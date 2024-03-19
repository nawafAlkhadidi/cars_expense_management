// ignore_for_file: use_build_context_synchronously,
import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/widgets/date_range_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart' show DateFormat;

final billsViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<BillsViewModel>());

class BillsViewModel extends ChangeNotifier {
  final BillsRepositories billsRepositories;
  final CarRepositories carDataSource;
  // constructor
  BillsViewModel(this.billsRepositories, this.carDataSource);

  TextEditingController? dataController,
      carNameController,
      carOdometerController,
      carCurrentOdometerController,
      distanceController,
      priceController,
      nameController,
      detailsController;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int indexPage = 0;
  BillModels bills = BillModels();
  CarModel car = CarModel();
  List<CarModel> cars = [];

  void setIndex(int newIndex) {
    indexPage = newIndex;
    notifyListeners();
  }

  void initController() {
    dataController = TextEditingController();
    carNameController = TextEditingController();
    carOdometerController = TextEditingController();
    carCurrentOdometerController = TextEditingController();
    distanceController = TextEditingController();
    priceController = TextEditingController();
    nameController = TextEditingController();
    detailsController = TextEditingController();
  }

  Future<List<CarModel>> getCars() async {
    return carDataSource.getCars();
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
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: 450,
                width: 450,
                child: FutureBuilder<List<CarModel>>(
                    future: carDataSource.getCars(),
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
                    }))).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
      },
    );
  }

  selectCar({CarModel? selectedCar}) {
    car = selectedCar!;
    carNameController?.text = "${car.typeOfCar!} | ${car.plateNumbers!} | ${car.plateLetters.toString()}";
    carOdometerController?.text = car.currentOdometer.toString();
  }

  _onSelectionChanged(DateRangePickerSelectionChangedArgs data, BuildContext context) {
    dataController?.text = DateFormat('yyyy/MM/dd').format((data.value));
    Navigator.pop(context);
  }

  claer() {
    dataController?.clear();
  }

  Widget getScreen(int index) {
    switch (index) {
      case 1:
        return const AddBillScreen();
      default:
        return const BillsScreen();
    }
  }

  void addbill({required BuildContext context}) async {
    // billsRepositories.getAllBills();
    //    if (globalKey.currentState!.validate()) {
    //     bills.price = double.tryParse(priceController.value.text);
    //     bills.details = detailsController.value.text;
    //     bills.personName = nameController.value.text;
    //     bills.createdAt = dataController.value.text;
    //     bills.distance = distanceController.value.text;
    //     bills.currentOdometer = carCurrentOdometerController.value.text;
    //     bills.previousOdometer = carOdometerController.value.text;
    //     // bills.carId = carNameController.value.text;
    //     bills.carId = 4;
    //     bills.expenseId = 2;
    //     bool status = await billsRepositories.addNewBills(bills);
    //     if (status) {
    //       setIndex(0);
    //     }
    //   //   //  }
  }
}
