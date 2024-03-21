import 'package:cars_expense_management/library.dart';

class AddExpenseTypeScreen extends ConsumerStatefulWidget {
  const AddExpenseTypeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddExpenseTypeScreenState();
}

class _AddExpenseTypeScreenState extends ConsumerState<AddExpenseTypeScreen> {
  @override
  void initState() {
    ref.read(expenseTypesViewModelProvider).initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(expenseTypesViewModelProvider);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppBrand.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: viewModel.globalKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(child: Text("مصروف جديد", style: Theme.of(context).appBarTheme.titleTextStyle)),
                      const Expanded(flex: 5, child: SizedBox()),
                      Flexible(
                        child: GFButton(
                            size: 50,
                            fullWidthButton: true,
                            onPressed: () => viewModel.addNewType(context: context),
                            text: "إضافة",
                            textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                            shape: GFButtonShape.standard,
                            color: AppBrand.mainColor),
                      ).animate().scale(),
                      const SizedBox(width: 30),
                      Flexible(
                        child: GFButton(
                            size: 50,
                            fullWidthButton: true,
                            onPressed: () => viewModel.setIndexPage(0),
                            text: "إلغاء",
                            textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                            shape: GFButtonShape.standard,
                            color: GFColors.DANGER),
                      ).animate().scale(),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 30),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(child: Text("المصاريف", style: Theme.of(context).appBarTheme.titleTextStyle)),
                //       const Expanded(flex: 4, child: SizedBox()),
                //       Flexible(
                //         child: GFButton(
                //           size: 50,
                //           fullWidthButton: true,
                //           onPressed: () => viewModel.setIndexPage(1),
                //           // onPressed: () => context.push('/AddTypeExScreen').whenComplete(() => viewModel.getExpense()),
                //           text: "إضافة",
                //           textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                //           shape: GFButtonShape.standard,
                //           color: AppBrand.mainColor,
                //         ),
                //       ).animate().scale(),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 100),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50, child: Center(child: Text("اسم المصروف: "))),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: size.width * 0.5,
                      child: myTextFiled(
                        controller: viewModel.expenNameController,
                        labelText: "",
                        keyboardType: TextInputType.number,
                        isvalidator: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال اسم المصروف بشكل صحيح";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: size.height * 0.1),
                // SizedBox(
                //   width: size.width * 0.5,
                //   child: GFButton(
                //       size: 60,
                //       fullWidthButton: true,
                //       onPressed: () => viewModel.addNewType(context: context),
                //       text: "إضافة مصروف جديد",
                //       textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                //       shape: GFButtonShape.standard,
                //       color: AppBrand.mainColor),
                // ),
              ],
            ),
          ),
        ));
  }
}
