import 'package:cars_expense_management/library.dart';

final addExpenseTypeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<AddExpenseTypeViewModel>());

class AddExpenseTypeViewModel extends ChangeNotifier {
  final ExpenseTypesRepositories expenseTypesRepositories;
  // constructor
  AddExpenseTypeViewModel(this.expenseTypesRepositories);

  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TypeOfExpenseModels newType = TypeOfExpenseModels();

  GlobalKey get getGlobalKey => globalKey;

  void addNewType({required BuildContext context}) async {
    if (globalKey.currentState!.validate()) {
      newType.name = nameController.value.text;

      bool status = await expenseTypesRepositories.addNewType(newType);
      if (status) {
        Navigator.pop(context);
      }
    }
  }
}
