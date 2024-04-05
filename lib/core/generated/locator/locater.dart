import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/bills/data_source/bills_data_source.dart';
import 'package:cars_expense_management/screens/home/home_view_model.dart';
import 'package:cars_expense_management/screens/settings/settings_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DatabaseService());
  // //! stores
  locator.registerLazySingleton(() => CarRepositories(locator()));
  // locator.registerFactory(() => AddCarViewModel(locator()));
  locator.registerFactory(() => CarDataSource());
  locator.registerFactory(() => CarViewModel(locator(), locator()));

  locator.registerLazySingleton(() => ExpenseTypesRepositories(locator()));
  locator.registerLazySingleton(() => ExpensesDataSource());
  locator.registerFactory(() => ExpenseTypesViewModel(locator(), locator()));
  // locator.registerFactory(() => AddExpenseTypeViewModel(locator()));

  locator.registerLazySingleton(() => BillsRepositories(locator()));
  locator.registerLazySingleton(() => BillDataSource());

  locator.registerFactory(() => BillsViewModel(locator(), locator(), locator()));
  locator.registerFactory(() => HomeViewModel(locator(), locator()));
  locator.registerFactory(() => SettingViewModel());
}
