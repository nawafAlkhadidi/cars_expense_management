import 'package:cars_expense_management/core/modules/repositories/bills_repositories.dart';
import 'package:cars_expense_management/core/modules/repositories/car_repositories.dart';
import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/bills/bills_view_model.dart';
import 'package:cars_expense_management/screens/cars/data_source/cars_data_source.dart';
import 'package:cars_expense_management/screens/expense_types/data_source/expense_types_data_source.dart';

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
  locator.registerFactory(() => BillsViewModel(locator(), locator()));
}
