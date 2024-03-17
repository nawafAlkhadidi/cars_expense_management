import 'package:cars_expense_management/library.dart';

class AddCarScreen extends ConsumerWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(addCarViewModelProvider);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppBrand.backgroundColor,
        appBar: AppBar(
            title: Text("إضافة سيارة", style: Theme.of(context).textTheme.bodySmall),
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
                    const SizedBox(height: 50, child: Center(child: Text("رقم اللوحة : "))),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: size.width * 0.5,
                      child: myTextFiled(
                        controller: viewModel.plateNumbersController,
                        labelText: "",
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        isvalidator: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "الرجاء إدخال ارقام لوحة السيارة";
                          }
                          if (value.length > 5) {
                            return "عدد ارقام اللوحة 4 خانات";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50, child: Center(child: Text("حروف اللوحة : "))),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: size.width * 0.5,
                      child: myTextFiled(
                          controller: viewModel.plateLettersController,
                          isvalidator: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "الرجاء إدخال حروف لوحة السيارة";
                            }
                            if (value.length > 5) {
                              return "عدد حروف اللوحة 4 خانات";
                            }
                            return null;
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.deny(RegExp(r'\d')),
                          ],
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
                    const SizedBox(height: 50, child: Center(child: Text(" رقم الهيكل : "))),
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
                    const SizedBox(height: 50, child: Center(child: Text("موديل السيارة : "))),
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
                    const SizedBox(height: 50, child: Center(child: Text(" عداد المسافة : "))),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                        width: size.width * 0.5,
                        child: myTextFiled(
                            controller: viewModel.currentOdometerController,
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
                    const SizedBox(height: 50, child: Center(child: Text("نوع السيارة : "))),
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
                SizedBox(height: size.height * 0.1),
                SizedBox(
                  width: size.width * 0.5,
                  child: GFButton(
                      size: 60,
                      fullWidthButton: true,
                      onPressed: () => viewModel.addcar(context: context),
                      text: "إضافة سيارة جديدة",
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
