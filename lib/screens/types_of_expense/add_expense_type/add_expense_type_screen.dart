import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/types_of_expense/add_expense_type/add_expense_type_view_model.dart';

class AddExpenseTypeScreen extends ConsumerWidget {
  const AddExpenseTypeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(addExpenseTypeViewModelProvider);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppBrand.backgroundColor,
        appBar: AppBar(
            title: Text("إضافة صنف", style: Theme.of(context).textTheme.bodySmall),
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            centerTitle: true,
            leading: IconButton(onPressed: context.pop, icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
            backgroundColor: AppBrand.mainColor),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Form(
            key: viewModel.globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        controller: viewModel.nameController,
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
                SizedBox(height: size.height * 0.1),
                SizedBox(
                  width: size.width * 0.5,
                  child: GFButton(
                      size: 60,
                      fullWidthButton: true,
                      onPressed: () => viewModel.addNewType(context: context),
                      text: "إضافة مصروف جديد",
                      textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                      shape: GFButtonShape.standard,
                      color: AppBrand.mainColor),
                ),
              ],
            ),
          ),
        ));
  }
}
