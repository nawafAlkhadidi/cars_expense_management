import 'dart:ui';

import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/home/home_view_model.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        backgroundColor: AppBrand.backgroundHome,
        appBar: AppBar(
          title: const Text("الرئيسية"),
          surfaceTintColor: AppBrand.backgroundHome,
          backgroundColor: AppBrand.backgroundHome,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                      },
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomBox(
                          size: size,
                          icon: const Icon(Icons.car_rental_outlined),
                          title: "عدد السيارات",
                          subtitle: viewModel.summary.totalCars.toString(),
                          color: Colors.blue.withOpacity(0.2),
                        ),
                        CustomBox(
                          size: size,
                          icon: const Icon(Icons.document_scanner),
                          title: "عدد الفواتير",
                          subtitle: viewModel.summary.totalBills.toString(),
                          color: Colors.amber.withOpacity(0.2),
                        ),
                        CustomBox(
                          size: size,
                          icon: const Icon(Icons.merge_type),
                          title: "عدد الاصناف",
                          subtitle: viewModel.summary.totalExpenseTypes.toString(),
                          color: Colors.greenAccent.withOpacity(0.2),
                        ),
                        CustomBox(
                          size: size,
                          icon: const Icon(Icons.price_change_outlined, color: Colors.grey),
                          title: "إجمالي الفواتير",
                          subtitle: viewModel.summary.totalPrice.toString(),
                          color: Colors.amber.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey.shade300, width: 2)),
                      height: 300,
                      width: size.width * .37,
                      padding: const EdgeInsets.only(top: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text("إجمالي الفواتير السنوية", style: TextStyle(fontSize: 16)),
                          ),
                          Flexible(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceEvenly,
                                    barTouchData: BarTouchData(enabled: true),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(showTitles: true, reservedSize: 40, getTitlesWidget: viewModel.bottomTitlesGroups1)),
                                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false, reservedSize: 40)),
                                    ),
                                    gridData: FlGridData(
                                        show: true,
                                        getDrawingVerticalLine: (value) => FlLine(color: AppBrand.mainColor.withOpacity(0.1), strokeWidth: 1),
                                        getDrawingHorizontalLine: (value) => FlLine(color: AppBrand.mainColor.withOpacity(0.1), strokeWidth: 1),
                                        drawHorizontalLine: true,
                                        drawVerticalLine: true),
                                    borderData: FlBorderData(show: false),
                                    barGroups: viewModel.barGroups1,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ).animate().scale(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                      ),
                      height: 300,
                      width: size.width * .37,
                      padding: const EdgeInsets.only(top: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 5), child: Text("إجمالي الفواتير الاسبوعية", style: TextStyle(fontSize: 16))),
                          Flexible(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceEvenly,
                                    barTouchData: BarTouchData(enabled: true),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(showTitles: true, reservedSize: 40, getTitlesWidget: viewModel.bottomTitlesGroups2)),
                                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    ),
                                    gridData: FlGridData(
                                        show: true,
                                        getDrawingVerticalLine: (value) => FlLine(color: AppBrand.mainColor.withOpacity(0.1), strokeWidth: 1),
                                        getDrawingHorizontalLine: (value) => FlLine(color: AppBrand.mainColor.withOpacity(0.1), strokeWidth: 1),
                                        drawHorizontalLine: true,
                                        drawVerticalLine: true),
                                    borderData: FlBorderData(show: false),
                                    barGroups: viewModel.barGroups2,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ).animate().scale(),
                  ],
                ),
              ],
            ),
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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 00),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(5)), border: Border.all(color: Colors.grey.shade300, width: 1.5)),
      height: 120,
      width: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              Text(title, style: const TextStyle(fontSize: 17, color: Colors.grey)),
              Text(subtitle, style: const TextStyle(fontSize: 27, color: Colors.black))
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(height: 40, width: 40, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(10))), child: icon),
        ],
      ),
    ).animate().flip();
  }
}
