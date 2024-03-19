import 'package:cars_expense_management/library.dart';

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
