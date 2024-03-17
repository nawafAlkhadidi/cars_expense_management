import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/types_of_expense/add_expense_type/add_expense_type_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const LayoutScreen(),
    ),
    GoRoute(
      name: 'AddCarScreen',
      path: '/AddCarScreen',
      builder: (context, state) => const AddCarScreen(),
    ),
    GoRoute(
      name: 'AddTypeExScreen',
      path: '/AddTypeExScreen',
      builder: (context, state) => const AddExpenseTypeScreen(),
    ),
    // GoRoute(
    //   name: 'AddBillScreen',
    //   path: '/AddBillScreen',
    //   builder: (context, state) => const AddBillScreen(),
    // ),
  ],
);
