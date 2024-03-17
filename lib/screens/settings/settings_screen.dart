import 'package:cars_expense_management/library.dart';

class SettingsScrren extends StatelessWidget {
  const SettingsScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: GFButton(
                size: 50,
                fullWidthButton: false,
                onPressed: () => {},
                text: "إضافة نوع مصروف",
                textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                shape: GFButtonShape.standard,
                color: AppBrand.mainColor),
          ),
        ],
      ),
    );
  }
}
