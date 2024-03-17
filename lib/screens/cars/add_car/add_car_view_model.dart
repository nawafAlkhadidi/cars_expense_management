// ignore_for_file: use_build_context_synchronously

import 'package:cars_expense_management/core/modules/repositories/car_repositories.dart';
import 'package:cars_expense_management/library.dart';

final addCarViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<AddCarViewModel>());

class AddCarViewModel extends ChangeNotifier {
  final CarRepositories carsRepositories;
  // constructor
  AddCarViewModel(this.carsRepositories);

  TextEditingController plateNumbersController = TextEditingController();
  TextEditingController plateLettersController = TextEditingController();
  TextEditingController vinController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController typeOfCarController = TextEditingController();
  TextEditingController currentOdometerController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  CarModel newCar = CarModel();

  void addcar({required BuildContext context}) async {
    if (globalKey.currentState!.validate()) {
      newCar.plateNumbers = int.tryParse(plateNumbersController.value.text);
      newCar.plateLetters = plateLettersController.value.text;
      newCar.vin = vinController.value.text;
      newCar.carModel = int.tryParse(carModelController.value.text);
      newCar.typeOfCar = typeOfCarController.value.text;
      newCar.currentOdometer = int.tryParse(currentOdometerController.value.text);
      bool status = await carsRepositories.addcar(newCar);
      if (status) {
        // locator<CarViewModel>().cars.no(newCar);
        // locator<CarViewModel>().notify();
        Navigator.pop(context);
      }
    }
  }
}
