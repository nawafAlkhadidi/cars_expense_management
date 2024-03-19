import 'package:cars_expense_management/library.dart';

class BillsLayout extends ConsumerWidget {
  const BillsLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(billsViewModelProvider);

    return Scaffold(backgroundColor: AppBrand.backgroundColor, body: viewModel.getScreen(viewModel.indexPage));
  }
}
