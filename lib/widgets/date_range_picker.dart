import 'package:cars_expense_management/library.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateRangePicker extends StatelessWidget {
  final void Function(DateRangePickerSelectionChangedArgs, BuildContext context)? onSelectionChanged;

  const CustomDateRangePicker({super.key, this.onSelectionChanged});
  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
        initialDisplayDate: DateTime.now(),
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) => onSelectionChanged!(dateRangePickerSelectionChangedArgs, context),
        selectionMode: DateRangePickerSelectionMode.single,
        headerStyle: const DateRangePickerHeaderStyle(textStyle: TextStyle(fontSize: 22, color: Colors.black)),
        yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: Theme.of(context).textTheme.bodyLarge, todayTextStyle: const TextStyle(fontSize: 16, color: Colors.deepPurple)),
        rangeTextStyle: const TextStyle(color: Colors.red),
        monthCellStyle: const DateRangePickerMonthCellStyle(
            textStyle: TextStyle(color: Colors.black, fontSize: 18),
            todayTextStyle: TextStyle(color: Colors.deepPurple, fontSize: 18),
            weekendTextStyle: TextStyle(color: Colors.black, fontSize: 18)),
        selectionTextStyle: const TextStyle(color: Colors.white, fontSize: 20));
  }
}
