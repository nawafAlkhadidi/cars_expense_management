import 'package:cars_expense_management/library.dart';

class DetailsBillScreen extends ConsumerWidget {
  final BillModels billData;
  const DetailsBillScreen({super.key, required this.billData});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(billsViewModelProvider);

    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  SizedBox(child: Text("تفاصيل الفاتورة #${billData.id}", style: Theme.of(context).appBarTheme.titleTextStyle)),
                  const Expanded(child: SizedBox()),
                  GFButton(
                      size: 45,
                      fullWidthButton: false,
                      onPressed: () {
                        viewModel.removeModel();
                        viewModel.setIndex(0);
                      },
                      text: "  رجوع  ",
                      textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                      shape: GFButtonShape.standard,
                      color: GFColors.DANGER),
                ],
              ),
            ),
            // const SizedBox(height: 50),
            Container(
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
                          height: 75,
                          child: myTextFiled(
                            height: 75,
                            fillColor: Colors.white,
                            labelText: "",
                            readOnly: true,
                            initialValue: billData.createdAt,
                            keyboardType: TextInputType.none,
                            isvalidator: false,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(height: 50, child: Center(child: Text("السيارة", style: Theme.of(context).textTheme.labelMedium))),
                        SizedBox(width: size.width * 0.012),
                        SizedBox(
                          width: size.width * 0.35,
                          child: myTextFiled(
                            height: 80,
                            readOnly: true,
                            initialValue: "${billData.typeOfCar!} | ${billData.plateNumbers!} | ${billData.plateLetters}",
                            fillColor: Colors.white,
                            labelText: "",
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
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
                            initialValue: billData.lastOdometer.toString(),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                            height: 60,
                            width: 65,
                            child: Center(child: Text("عداد المسافة الجديد ", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                        SizedBox(width: size.width * 0.012),
                        Expanded(
                          flex: 3,
                          child: myTextFiled(
                            height: 80,
                            fillColor: Colors.white,
                            labelText: "",
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            initialValue: billData.newOdometer.toString(),
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
                            keyboardType: TextInputType.none,
                            initialValue: billData.distance.toString(),
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
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            initialValue: billData.price.toString(),
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
                            keyboardType: TextInputType.none,
                            initialValue: billData.personName,
                            readOnly: true,
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
                            keyboardType: TextInputType.none,
                            initialValue: billData.expenseName,
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
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            initialValue: billData.details,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 50),

            // const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
