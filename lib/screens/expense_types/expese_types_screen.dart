import 'package:cars_expense_management/library.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ExpenseTypesScreen extends ConsumerWidget {
  const ExpenseTypesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(expenseTypesViewModelProvider);
    // Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppBrand.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(child: Text("المصاريف", style: Theme.of(context).appBarTheme.titleTextStyle)),
                  const Expanded(flex: 4, child: SizedBox()),
                  Flexible(
                    child: GFButton(
                      size: 50,
                      fullWidthButton: true,
                      onPressed: () => viewModel.setIndexPage(1),
                      // onPressed: () => context.push('/AddTypeExScreen').whenComplete(() => viewModel.getExpense()),
                      text: "صنف جديد",
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
                      // sortIcon: const SizedBox(),
                      currentCellStyle: const DataGridCurrentCellStyle(borderColor: AppBrand.backgroundDrawer, borderWidth: 400)),
                  child: SfDataGrid(
                    //key: _key,
                    source: viewModel.expensesDataSource,
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
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                          autoFitPadding: const EdgeInsets.all(2.0),
                          label: Container(padding: const EdgeInsets.all(7.0), alignment: Alignment.center, child: const Text('#'))),
                      GridColumn(
                          columnName: 'name',
                          filterIconPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                          label: Container(
                              alignment: Alignment.center,
                              child: Text('اسم الصنف', textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
