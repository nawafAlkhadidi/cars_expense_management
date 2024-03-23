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
        backgroundColor: AppBrand.backgroundColor,
        appBar: AppBar(title: const Text("الرئيسية")),
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            // color: AppBrand.mainColor.withOpacity(0.3),
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
        // backgroundBlendMode: BlendMode.dstATop,
        //color: AppBrand.mainColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      height: size.height * 0.25,
      width: size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Container(height: 45, width: 45, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(10))), child: icon),
            ],
          ),
          const Expanded(child: SizedBox()),
          Text(title, style: const TextStyle(fontSize: 23, color: Colors.black)),
          const Expanded(child: SizedBox()),
          Center(child: Text(subtitle, style: const TextStyle(fontSize: 35, color: Colors.black)))
        ],
      ),
    );
  }
}
