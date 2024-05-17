import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/settings/settings_view_model.dart';
import 'package:cars_expense_management/widgets/buttons/custom_button.dart';

class SettingsScrren extends ConsumerWidget {
  const SettingsScrren({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("الإعدادات"), surfaceTintColor: AppBrand.backgroundHome, backgroundColor: AppBrand.backgroundHome),
      backgroundColor: AppBrand.backgroundHome,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomButton(fun: () => viewModel.getDatabasesFile(), text: "تغير كلمة المرور"),
            CustomButton(fun: () => viewModel.getDatabasesFile(), text: "إستخراج قاعدة البيانات"),
            CustomButton(fun: () => viewModel.handleDeleteWidget(context: context), color: GFColors.DANGER, text: "اعادة ضبط قاعدة البيانات"),
          ],
        ),
      ),
    );
  }
}
