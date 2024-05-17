import 'package:cars_expense_management/library.dart';

class CarsScreen extends ConsumerWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(carViewModelProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(child: Text("السيارات", style: Theme.of(context).appBarTheme.titleTextStyle)),
              const Expanded(flex: 5, child: SizedBox()),
              Flexible(
                child: GFButton(
                  size: 50,
                  fullWidthButton: true,
                  onPressed: () => viewModel.setIndexPage(1),
                  text: "سيارة جديدة",
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
                key: viewModel.key1,
                source: viewModel.carDataSource,
                columnWidthMode: ColumnWidthMode.fill,
                endSwipeActionsBuilder: viewModel.buildEndSwipeWidget,
                startSwipeActionsBuilder: viewModel.buildStartSwipeWidget,
                allowSwiping: true,
                showHorizontalScrollbar: true,
                allowColumnsResizing: true,
                allowColumnsDragging: true,
                gridLinesVisibility: GridLinesVisibility.both,
                allowTriStateSorting: true,
                columnResizeMode: ColumnResizeMode.onResizeEnd,
                allowSorting: true,
                allowFiltering: true,
                footerFrozenColumnsCount: 0,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'id',
                      columnWidthMode: ColumnWidthMode.auto,
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      autoFitPadding: const EdgeInsets.all(2.0),
                      label: Container(
                          padding: const EdgeInsets.all(7.0), alignment: Alignment.center, child: Text('#', style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'plateNumbers',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center, child: Text('رقم اللوحة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'paintLetters',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('حروف اللوحة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'vin',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center, child: Text('الهيكل', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      columnName: 'typeOfCar',
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('نوع السيارة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      columnName: 'carModel',
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('موديل السيارة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'lastOdometer',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('عداد المسافة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'inspectionExpiration',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('تاريخ الفحص', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                  GridColumn(
                      columnName: 'licenseExpiration',
                      filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      label: Container(
                          alignment: Alignment.center,
                          child: Text('تاريخ الاستمارة', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
