import 'package:cars_expense_management/core/modules/models/summary_model.dart';
import 'package:cars_expense_management/core/modules/models/total_bills_models.dart';
import 'package:cars_expense_management/core/modules/models/weekly_summary_model.dart';
import 'package:cars_expense_management/library.dart';
import 'package:fl_chart/fl_chart.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<HomeViewModel>());

class HomeViewModel extends ChangeNotifier {
  final BillsRepositories billsRepositories;
  final CarRepositories carRepositories;

  HomeViewModel(this.billsRepositories, this.carRepositories) {
    getbill();
    getSummary();
    getTotalbillsWeekly();
  }

  List<BarChartGroupData> barGroups1 = [];
  List<BarChartGroupData> barGroups2 = [];
  SummaryModel summary = SummaryModel();

  Widget bottomTitlesGroups1(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 01:
        text = 'May';
        break;
      case 02:
        text = 'Jun';
        break;
      case 03:
        text = 'Jul';
        break;
      case 04:
        text = 'Aug';
        break;
      case 05:
        text = 'May';
        break;
      case 06:
        text = 'Jun';
        break;
      case 07:
        text = 'Jul';
        break;
      case 08:
        text = 'Aug';
        break;
      case 09:
        text = 'Sep';
        break;
      case 10:
        text = 'Oct';
        break;
      case 11:
        text = 'Nov';
        break;
      case 12:
        text = 'Dec';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  numberOFday(String nameOfday) {
    switch (nameOfday) {
      case "Saturday":
        return 0;
      case "Sunday":
        return 1;

      case "Monday":
        return 2;

      case "Tuesday":
        return 3;

      case "Wednesday":
        return 4;

      case "Thursday":
        return 5;

      case "Friday":
        return 6;

      default:
        break;
    }
  }

  Widget bottomTitlesGroups2(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Saturday';
        break;
      case 1:
        text = 'Sunday';
        break;
      case 2:
        text = 'Monday';
        break;
      case 3:
        text = 'Tuesday';
        break;
      case 4:
        text = 'Wednesday';
        break;
      case 5:
        text = 'Thursday';
        break;
      case 6:
        text = 'Friday';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  void getSummary() async {
    summary = await billsRepositories.getSummary();
  }

  void getbill() async {
    List<TotalBillsModels> list = await billsRepositories.getTotalbillsAnnual(DateFormat('yyyy').format((DateTime.now())));
    for (var bill in list) {
      barGroups1.add(BarChartGroupData(x: bill.monthNumber!, barsSpace: 5, barRods: [
        BarChartRodData(
          fromY: 0,
          toY: bill.totalPrice!,
          width: 15,
          color: AppBrand.drawerButtonColor,
        )
      ]));
      //  print(bills[2].totalPrice);
    }
    notifyListeners();
  }

  void getTotalbillsWeekly() async {
    List<WeeklySummaryModel> list = await billsRepositories.getTotalbillsWeekly();
    for (var bill in list) {
      barGroups2.add(BarChartGroupData(
          x: numberOFday(bill.day!), barRods: [BarChartRodData(fromY: 0, toY: bill.totalPriceBills!, width: 15, color: AppBrand.drawerButtonColor)]));
      //  print(bills[2].totalPrice);
    }
    notifyListeners();
  }
}
