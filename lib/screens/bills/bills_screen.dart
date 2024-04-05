import 'package:cars_expense_management/library.dart';
export 'package:cars_expense_management/screens/bills/bills_view_model.dart';

class BillsScreen extends ConsumerWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(billsViewModelProvider);
    // Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(child: Text("الفواتير", style: Theme.of(context).appBarTheme.titleTextStyle)),
              const Expanded(flex: 5, child: SizedBox()),
              Flexible(
                child: GFButton(
                  size: 50,
                  fullWidthButton: true,
                  onPressed: () => viewModel.setIndex(1),
                  text: "فاتورة جديدة",
                  textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                  shape: GFButtonShape.standard,
                  color: AppBrand.mainColor,
                ),
              ).animate().scale(),
              const SizedBox(width: 30),
              Flexible(
                child: GFButton(
                  size: 50,
                  fullWidthButton: true,
                  onPressed: () => viewModel.exportToExcelWorkbook(),
                  text: "تصدير",
                  textStyle: const TextStyle(fontSize: 16, fontFamily: "Tajawal"),
                  shape: GFButtonShape.standard,
                  color: AppBrand.mainColor,
                ),
              ).animate().scale(),
            ],
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: viewModel.drawBorder(),
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                  brightness: Brightness.light,
                  headerColor: AppBrand.tableHeaderColor,
                  gridLineStrokeWidth: 1.5,
                  rowHoverColor: Colors.grey.withOpacity(0.2),
                  frozenPaneLineColor: Colors.grey.withOpacity(0.3),
                  headerHoverColor: Colors.grey.withOpacity(0.3),
                  sortIconColor: AppBrand.mainColor,
                  gridLineColor: Colors.grey.withOpacity(0.3),
                  columnResizeIndicatorColor: Colors.black12,
                  filterIconHoverColor: Colors.white,
                  filterIconColor: AppBrand.mainColor,
                  currentCellStyle: const DataGridCurrentCellStyle(borderColor: AppBrand.backgroundDrawer, borderWidth: 400)),
              child: SfDataGrid(
                key: viewModel.key,
                source: viewModel.billDataSource,
                endSwipeActionsBuilder: viewModel.buildEndSwipeWidget,
                allowSwiping: true,
                showHorizontalScrollbar: true,
                allowColumnsResizing: true,
                allowColumnsDragging: true,
                gridLinesVisibility: GridLinesVisibility.both,
                allowTriStateSorting: true,
                columnResizeMode: ColumnResizeMode.onResizeEnd,
                allowSorting: true,
                allowFiltering: true,
                isScrollbarAlwaysShown: true,
                defaultColumnWidth: 150,
                onCellTap: (details) => (viewModel.goToBillDetails(details, context)),
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'id',
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      autoFitPadding: const EdgeInsets.all(2.0),
                      label: Container(
                          padding: const EdgeInsets.all(7.0), alignment: Alignment.center, child: Text('#', style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'date',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      columnWidthMode: ColumnWidthMode.fitByColumnName,
                      label: Container(
                          alignment: Alignment.center, child: Text('التاريخ', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'car',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      columnWidthMode: ColumnWidthMode.fitByCellValue,
                      label: Container(
                          alignment: Alignment.center, child: Text('السيارة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'expenseName',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center, child: Text('المصروف', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      columnName: 'price',
                      // columnWidthMode: ColumnWidthMode.fitByCellValue,
                      label: Container(
                          alignment: Alignment.center, child: Text('السعر', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      columnName: 'details',
                      label: Container(
                          alignment: Alignment.center, child: Text('التفاصيل', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'personName',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center, child: Text('اسم الشخص', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'previousOdometer',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center,
                          child: Text(' العداد السابق', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'newOdometer',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('العداد الجديد', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'distance',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center, child: Text('المسافة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
