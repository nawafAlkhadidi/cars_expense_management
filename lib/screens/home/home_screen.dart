import 'package:cars_expense_management/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void cc() async {
  //   await DatabaseHelper.instance.insert();
  // }

  Future<void> insert() async {
    // Database db = await DatabaseService().database;
    // // Database db = await DatabaseHelper.database;

    // print("insert");
    // CarModel newCar = CarModel();
    // newCar.plateNumbers = 1234;
    // newCar.paintLetters = "2";
    // newCar.vin = 'VIN123';
    // newCar.carModel = 1;
    // newCar.typeOfCar = 'SUV';
    // await db.insert('car', newCar.toMap()).then((value) => print(value.toString()));
    // print(db.query('car').toString());

    // List<Map<String, dynamic>> bills = await db.query('car');
    // for (var bill in bills) {
    //   print(bill);
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        backgroundColor: AppBrand.backgroundHome,
        appBar: AppBar(
          title: const Text("الرئيسية"),
          surfaceTintColor: AppBrand.backgroundHome,
          backgroundColor: AppBrand.backgroundHome,
        ),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      insert();
                    },
                    child: CustomBox(
                      size: size,
                      icon: const Icon(Icons.macro_off_outlined),
                      title: "عدد السيارات",
                      subtitle: "76",
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  CustomBox(
                    size: size,
                    icon: const Icon(Icons.countertops),
                    title: "عدد الفواتير",
                    subtitle: "100",
                    color: Colors.amber.withOpacity(0.2),
                  ),
                  CustomBox(
                    size: size,
                    icon: const Icon(Icons.macro_off_outlined),
                    title: "عدد الاصناف",
                    subtitle: "26",
                    color: Colors.greenAccent.withOpacity(0.2),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20, top: 20, bottom: 10),
                child: Text(
                  "أخر الفواتير",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomBox extends StatelessWidget {
  const CustomBox({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final Size size;
  final String title, subtitle;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 00),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
      height: size.height * 0.18,
      width: size.width * 0.16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Container(height: 40, width: 40, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(10))), child: icon),
            ],
          ),
          const Expanded(child: SizedBox()),
          Text(title, style: const TextStyle(fontSize: 17, color: Colors.grey)),
          const Expanded(child: SizedBox()),
          Text(subtitle, style: const TextStyle(fontSize: 20, color: Colors.black))
        ],
      ),
    );
  }
}
