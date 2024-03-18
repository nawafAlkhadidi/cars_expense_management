import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/bills/bills_view_model.dart';

class BillsScreen extends ConsumerWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(billsViewModelProvider);
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                SizedBox(width: 100, child: Text("الفواتير", style: Theme.of(context).appBarTheme.titleTextStyle)),
                const Expanded(child: SizedBox()),
                GFButton(
                    size: 50,
                    fullWidthButton: false,
                    onPressed: () => viewModel.setIndex(1),
                    text: "فاتورة جديدة",
                    textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                    shape: GFButtonShape.standard,
                    color: AppBrand.drawerButtonColor),
                const SizedBox(width: 30),
                const GFButton(
                    size: 50,
                    fullWidthButton: false,
                    onPressed: null,
                    text: "بحث",
                    textStyle: TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                    shape: GFButtonShape.standard,
                    color: AppBrand.mainColor),
              ],
            ),
          ),
          Form(
            key: viewModel.globalKey,
            child: Container(
                width: size.width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: DataTable(
                    headingTextStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    dataTextStyle: const TextStyle(color: Colors.black, fontSize: 13.5),
                    columns: const [
                      DataColumn(label: Text("#")),
                      DataColumn(label: Text("التاريخ")),
                      DataColumn(label: Text("السيارة")),
                      DataColumn(label: Text("المصروف")),
                      DataColumn(label: Text("القيمة")),
                      DataColumn(label: Text("القراءة السابقه")),
                      DataColumn(label: Text("القراءة الحالية")),
                      DataColumn(label: Text("المسافة")),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Arshik')),
                        DataCell(Text('5644645')),
                        DataCell(Text('3')),
                        DataCell(Text('3')),
                        DataCell(Text('3')),
                        DataCell(Text('3')),
                        DataCell(Text('265\$')),
                      ])
                    ])),
          ),
          // const SizedBox(height: 50),
        ],
      ),
    ));
  }
}
