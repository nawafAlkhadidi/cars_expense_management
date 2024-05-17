import 'package:cars_expense_management/library.dart';
import 'package:pinput/pinput.dart';

class AddCarScreen extends ConsumerStatefulWidget {
  const AddCarScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends ConsumerState<AddCarScreen> {
  @override
  void initState() {
    ref.read(carViewModelProvider).initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(carViewModelProvider);
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Form(
        key: viewModel.globalKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(child: Text("إضافة سيارة جديدة", style: Theme.of(context).appBarTheme.titleTextStyle)),
                  const Expanded(flex: 5, child: SizedBox()),
                  Flexible(
                    child: GFButton(
                        size: 50,
                        fullWidthButton: true,
                        onPressed: () => viewModel.addcar(context: context),
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text("رقم اللوحة : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                Container(
                  width: size.width * 0.5,
                  height: 85,
                  alignment: Alignment.centerRight,
                  child: Pinput(
                      controller: viewModel.plateNumbersController,
                      length: 4,
                      errorTextStyle: TextStyle(fontSize: 14, color: Colors.red[900]),
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      pinAnimationType: PinAnimationType.scale,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء إدخال ارقام لوحة السيارة";
                        }
                        if (value.length > 5) {
                          return "عدد ارقام اللوحة 4 خانات";
                        }
                        return null;
                      },
                      //!  separator: const SizedBox(width: 10),
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(238, 238, 238, 1),
                          border: Border.all(
                            color: AppBrand.mainColor,
                            width: .4,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text("حروف اللوحة : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                Container(
                  width: size.width * 0.5,
                  height: 85,
                  alignment: Alignment.centerRight,
                  child: Pinput(
                      controller: viewModel.plateLettersController,
                      length: 3,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'\d')),
                      ],
                      errorTextStyle: TextStyle(fontSize: 14, color: Colors.red[900]),
                      pinAnimationType: PinAnimationType.scale,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء إدخال حروف لوحة السيارة";
                        }
                        if (value.length > 5) {
                          return "عدد حروف اللوحة 4 خانات";
                        }
                        return null;
                      },
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(238, 238, 238, 1),
                          border: Border.all(color: AppBrand.mainColor, width: .4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text(" رقم الهيكل : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: size.width * 0.5,
                  child: myTextFiled(
                      controller: viewModel.vinController,
                      isvalidator: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء إدخال رقم الهيكل";
                        }
                        return null;
                      },
                      labelText: "",
                      keyboardType: TextInputType.text),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text("موديل السيارة : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: size.width * 0.5,
                    child: myTextFiled(
                        controller: viewModel.carModelController,
                        isvalidator: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال موديل السيارة";
                          }

                          return null;
                        },
                        labelText: "",
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text(" عداد المسافة : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: size.width * 0.5,
                    child: myTextFiled(
                        controller: viewModel.lastOdometerController,
                        isvalidator: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال عداد المسافة لسيارة";
                          }

                          return null;
                        },
                        labelText: "",
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text("نوع السيارة : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: size.width * 0.5,
                    child: myTextFiled(
                        controller: viewModel.typeOfCarController,
                        isvalidator: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال نوع السيارة";
                          }

                          return null;
                        },
                        labelText: "",
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(RegExp(r'\d'))],
                        keyboardType: TextInputType.text)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text("تاريخ انتهاء الفحص : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: size.width * 0.5,
                    child: myTextFiled(
                        readOnly: true,
                        controller: viewModel.inspectionEXController,
                        onTap: () => viewModel.dateRangePickerDialog(context: context, controller: viewModel.inspectionEXController),
                        isvalidator: false,
                        suffixIcon: const Icon(Icons.date_range_outlined, color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال تاريخ انتهاء الفحص";
                          }

                          return null;
                        },
                        labelText: "",
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(RegExp(r'\d'))],
                        keyboardType: TextInputType.text)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50, child: Center(child: Text("تاريخ انتهاء الاستماره  : ", style: Theme.of(context).textTheme.labelMedium))),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: size.width * 0.5,
                    child: myTextFiled(
                        readOnly: true,
                        onTap: () => viewModel.dateRangePickerDialog(context: context, controller: viewModel.licenseEXController),
                        controller: viewModel.licenseEXController,
                        isvalidator: false,
                        suffixIcon: const Icon(Icons.date_range_outlined, color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال تاريخ انتهاء الاستماره ";
                          }

                          return null;
                        },
                        labelText: "",
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.deny(RegExp(r'\d'))],
                        keyboardType: TextInputType.text)),
              ],
            ),
            // SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
