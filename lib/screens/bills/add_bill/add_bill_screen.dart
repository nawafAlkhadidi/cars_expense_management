import 'package:cars_expense_management/library.dart';

class AddBillScreen extends ConsumerStatefulWidget {
  const AddBillScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddBillScreenState();
}

class _AddBillScreenState extends ConsumerState<AddBillScreen> {
  @override
  void initState() {
    ref.read(billsViewModelProvider).initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(billsViewModelProvider);
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        minimum: const EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 20),
        child: SingleChildScrollView(
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
              Form(
                key: viewModel.globalKey,
                child: Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50, width: 65, child: Center(child: Text("التاريخ", style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            SizedBox(
                              width: size.width * 0.2,
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
                            SizedBox(height: 50, child: Center(child: Text("السيارة", style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            SizedBox(
                              width: size.width * 0.35,
                              child: myTextFiled(
                                height: 80,
                                onTap: () => viewModel.carsPickerDialog(context: context),
                                controller: viewModel.carNameController,
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
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 65,
                                child: Center(child: Text("عداد المسافة", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 3,
                              child: myTextFiled(
                                height: 80,
                                fillColor: Colors.white54,
                                readOnly: true,
                                labelText: "",
                                keyboardType: TextInputType.number,
                                controller: viewModel.lastOdometerController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                isvalidator: false,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                                height: 60,
                                width: 65,
                                child:
                                    Center(child: Text("عداد المسافة الجديد ", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 3,
                              child: myTextFiled(
                                height: 80,
                                fillColor: Colors.white,
                                onChanged: viewModel.calculateODM,
                                labelText: "",
                                keyboardType: TextInputType.number,
                                controller: viewModel.newOdometerController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                isvalidator: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "الرجاء إدخال مسافة العداد الحالية";
                                  }
                                  if (int.parse(value) <= int.parse(viewModel.lastOdometerController.value.text)) {
                                    return "الرجاء إدخال مسافة عداد صحيح";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                                height: 50,
                                width: 65,
                                child: Center(child: Text("المسافة", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 3,
                              child: myTextFiled(
                                height: 80,
                                readOnly: true,
                                fillColor: Colors.white54,
                                labelText: "",
                                keyboardType: TextInputType.number,
                                controller: viewModel.distanceController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                isvalidator: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 65,
                                child: Center(child: Text("المبلغ", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 3,
                              child: myTextFiled(
                                height: 80,
                                fillColor: Colors.white,
                                labelText: "",
                                keyboardType: TextInputType.number,
                                controller: viewModel.priceController,
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
                            SizedBox(
                                height: 50,
                                // width: 50,
                                child: Center(child: Text("الأسم", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 6,
                              child: myTextFiled(
                                height: 80,
                                fillColor: Colors.white,
                                labelText: "",
                                keyboardType: TextInputType.text,
                                controller: viewModel.nameController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.singleLineFormatter,
                                ],
                                isvalidator: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "الرجاء إدخال الأسم";
                                  }

                                  return null;
                                },
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            SizedBox(
                                height: 55,
                                width: 70,
                                child: Center(child: Text("نوع المصروف", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 6,
                              child: myTextFiled(
                                height: 80,
                                fillColor: Colors.white,
                                labelText: "",
                                readOnly: true,
                                onTap: () => viewModel.expensePickerDialog(context: context),
                                keyboardType: TextInputType.text,
                                controller: viewModel.expenseController,
                                suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.singleLineFormatter,
                                ],
                                isvalidator: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "الرجاء إدخال نوع المصروف";
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 65,
                                child: Center(child: Text("التفاصيل", textAlign: TextAlign.start, style: Theme.of(context).textTheme.labelMedium))),
                            SizedBox(width: size.width * 0.012),
                            Expanded(
                              flex: 6,
                              child: myTextFiled(
                                height: 140,
                                maxLines: 6,
                                fillColor: Colors.white,
                                labelText: "",
                                keyboardType: TextInputType.multiline,
                                controller: viewModel.detailsController,
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

              // const SizedBox(height: 50),
            ],
          ),
        ));
  }
}
