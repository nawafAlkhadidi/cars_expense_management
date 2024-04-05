import 'package:cars_expense_management/library.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? fun;
  final Color color;
  const CustomButton({
    required this.text,
    required this.fun,
    this.color = AppBrand.mainColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: InkWell(
        onTap: fun,
        child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: SizedBox(
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              )),
            )),
      ),
    );
  }
}
