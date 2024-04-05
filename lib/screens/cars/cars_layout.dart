import 'package:cars_expense_management/library.dart';

class CarsLayout extends ConsumerWidget {
  const CarsLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(carViewModelProvider);

    return Scaffold(
        backgroundColor: AppBrand.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: viewModel.getScreen(viewModel.indexPage),
        ));
  }
}
