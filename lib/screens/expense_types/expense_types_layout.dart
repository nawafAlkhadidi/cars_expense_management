import 'package:cars_expense_management/library.dart';

class ExpenseTypesLayout extends ConsumerWidget {
  const ExpenseTypesLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(expenseTypesViewModelProvider);

    return Scaffold(backgroundColor: AppBrand.backgroundColor, body: viewModel.getScreen(viewModel.indexPage));
  }
}
