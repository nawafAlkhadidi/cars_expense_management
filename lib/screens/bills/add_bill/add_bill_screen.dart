import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/bills/bills_view_model.dart';

class AddBillScreen extends ConsumerWidget {
  const AddBillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(billsViewModelProvider);

    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
        minimum: const EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(child: Text("فاتورة جديدة", style: Theme.of(context).appBarTheme.titleTextStyle)),
                const Expanded(child: SizedBox()),
                GFButton(
                    size: 45,
                    fullWidthButton: false,
                    onPressed: () => viewModel.addbill(context: context),
                    text: "حفظ",
                    textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                    shape: GFButtonShape.standard,
                    color: AppBrand.mainColor),
                const SizedBox(width: 30),
                GFButton(
                    size: 45,
                    fullWidthButton: false,
                    onPressed: () => viewModel.setIndex(0),
                    text: "إلغاء",
                    textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                    shape: GFButtonShape.standard,
                    color: GFColors.DANGER),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Form(
                key: viewModel.globalKey,
                child: Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 70),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("التاريخ"))),
                          SizedBox(width: size.width * 0.012),
                          SizedBox(
                            width: size.width * 0.22,
                            child: myTextFiled(
                              height: 75,
                              fillColor: Colors.white,
                              labelText: "",
                              readOnly: true,
                              onTap: () => viewModel.dateRangePickerDialog(context: context),
                              controller: viewModel.dataController,
                              suffixIcon: const Icon(Icons.date_range_outlined, color: Colors.black),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              isvalidator: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "الرجاء إدخال تاريخ الفاتورة";
                                }

                                return null;
                              },
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const SizedBox(height: 50, child: Center(child: Text("السيارة"))),
                          SizedBox(width: size.width * 0.012),
                          SizedBox(
                            width: size.width * 0.38,
                            child: myTextFiled(
                              height: 75,
                              onTap: () => viewModel.carPickerDialog(context: context),
                              fillColor: Colors.white,
                              labelText: "",
                              suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              isvalidator: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "الرجاء اختيار السيارة";
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("عداد المسافة", textAlign: TextAlign.center))),
                          SizedBox(width: size.width * 0.012),
                          Expanded(
                            flex: 3,
                            child: myTextFiled(
                              height: 75,
                              fillColor: Colors.white54,
                              readOnly: true,
                              labelText: "",
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              isvalidator: false,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("المسافة الحالية", textAlign: TextAlign.center))),
                          SizedBox(width: size.width * 0.012),
                          Expanded(
                            flex: 3,
                            child: myTextFiled(
                              height: 75,
                              fillColor: Colors.white,
                              labelText: "",
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              isvalidator: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "الرجاء إدخال مسافة العداد الحالية";
                                }

                                return null;
                              },
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("المسافة", textAlign: TextAlign.center))),
                          SizedBox(width: size.width * 0.012),
                          Expanded(
                            flex: 3,
                            child: myTextFiled(
                              height: 75,
                              readOnly: true,
                              fillColor: Colors.white54,
                              labelText: "",
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              isvalidator: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("المبلغ", textAlign: TextAlign.center))),
                          SizedBox(width: size.width * 0.012),
                          Expanded(
                            flex: 2,
                            child: myTextFiled(
                              height: 75,
                              fillColor: Colors.white,
                              labelText: "",
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              isvalidator: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "الرجاء إدخال قيمة الفاتورة";
                                }

                                return null;
                              },
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("الأسم", textAlign: TextAlign.center))),
                          SizedBox(width: size.width * 0.012),
                          Expanded(
                            flex: 6,
                            child: myTextFiled(
                              height: 75,
                              fillColor: Colors.white,
                              labelText: "",
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              isvalidator: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "الرجاء إدخال الأسم  ";
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50, width: 65, child: Center(child: Text("التفاصيل", textAlign: TextAlign.start))),
                          SizedBox(width: size.width * 0.012),
                          Expanded(
                            flex: 6,
                            child: myTextFiled(
                              height: 150,
                              maxLines: 6,
                              fillColor: Colors.white,
                              labelText: "",
                              keyboardType: TextInputType.multiline,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              isvalidator: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 50),
          ],
        ));
  }
}
