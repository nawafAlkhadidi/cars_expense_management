// ignore_for_file: use_build_context_synchronously

import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/types_of_expense/data%20source/expense_types_data_source.dart';
import 'package:collection/collection.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

final typeOfExViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<ExpenseTypesViewModel>());

class ExpenseTypesViewModel extends ChangeNotifier {
  final ExpenseTypesRepositories expenseTypesRepositories;
  final ExpensesDataSource expensesDataSource;
  // constructor
  ExpenseTypesViewModel(this.expenseTypesRepositories, this.expensesDataSource) {
    getExpense();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TypeOfExpenseModels newExpense = TypeOfExpenseModels();

  List<TypeOfExpenseModels> expenseList = [];

  TextEditingController? expenIdController, expenNameController;

  void initController() {
    expenIdController = TextEditingController();
    expenNameController = TextEditingController();
  }

  void setDataTable() {
    expensesDataSource.setExpenses(expenseList);
    expensesDataSource.buildDataGridRows();
    notifyListeners();
  }

  void getExpense() async {
    expenseList.clear();
    expenseList = await expenseTypesRepositories.getAllExpense();
    setDataTable();
  }

  BoxDecoration drawBorder() {
    final BorderSide borderSide = BorderSide(color: Colors.grey.withOpacity(0.3));
    return BoxDecoration(border: Border(left: borderSide, right: borderSide, bottom: borderSide));
  }

  void deleteTheCar({required DataGridRow row, required BuildContext context}) async {
    final int index = expensesDataSource.dataGridRows.indexOf(row);
    bool status = await expenseTypesRepositories.deleteType(expensesDataSource.expensesList[index].id!);
    if (status) {
      final int index = expensesDataSource.dataGridRows.indexOf(row);
      expensesDataSource.dataGridRows.remove(row);
      expensesDataSource.expensesList.remove(expensesDataSource.expensesList[index]);
      expensesDataSource.updateDataSource();
      notifyListeners();
      Navigator.pop(context);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actions: <Widget>[TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          content: const Text('تم حذف الصنف بنجاح'),
        ),
      );
    }
  }

  Widget buildStartSwipeWidget(BuildContext context, DataGridRow row, int rowIndex) {
    return GestureDetector(
      onTap: () => _handleEditWidgetTap(row, context),
      child: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.edit, color: Colors.white, size: 20),
            SizedBox(width: 16.0),
            Text(
              'تعديل',
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget buildEndSwipeWidget(BuildContext context, DataGridRow row, int rowIndex) {
    return GestureDetector(
      onTap: () => _handleDeleteWidgetTap(row: row, context: context),
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white, size: 20),
            SizedBox(width: 16.0),
            Text(
              'حذف',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  void _updateTextFieldContext(DataGridRow row) {
    initController();
    final String? id = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'id')?.value.toString();
    expenIdController!.text = id ?? "";
    final String? expenName = row.getCells().firstWhereOrNull((DataGridCell element) => element.columnName == 'name')?.value.toString();
    expenNameController!.text = expenName ?? "";
  }

  void _processCellUpdate(DataGridRow row, BuildContext buildContext) async {
    if (_formKey.currentState!.validate()) {
      newExpense.id = int.parse(expenIdController!.value.text);
      newExpense.name = expenNameController!.value.text;

      bool status = await expenseTypesRepositories.upadteType(newExpense.id!, newExpense);
      if (status) {
        final int rowIndex = expensesDataSource.rows.indexOf(row);
        expensesDataSource.rows[rowIndex] = DataGridRow(cells: [
          DataGridCell<int>(columnName: 'id', value: newExpense.id),
          DataGridCell<String>(columnName: 'plateNumbers', value: newExpense.name),
        ]);
        // carDataSource.buildDataGridRows();
        expensesDataSource.updateDataSource();
        Navigator.pop(buildContext);

        notifyListeners();
      }
    }
  }

  List<Widget> _buildActionButtons(DataGridRow row, BuildContext buildContext) {
    return <Widget>[
      TextButton(
          onPressed: () => _processCellUpdate(row, buildContext),
          child: const Text('حفظ', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16))),
      TextButton(
          onPressed: () => Navigator.pop(buildContext),
          child: const Text('إلغاء', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)))
    ];
  }

  Widget _buildRow(
      {required TextEditingController controller, required String columnName, required TextInputFormatter filteringTextInput, required int length}) {
    final TextInputType keyboardType = filteringTextInput == FilteringTextInputFormatter.digitsOnly ? TextInputType.number : TextInputType.text;

    return Row(
      children: <Widget>[
        Container(width: 150, padding: const EdgeInsets.symmetric(vertical: 15), child: Text(columnName)),
        SizedBox(
          width: 150,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "يجب ألا يكون الحقل فارغًا";
              }
              if (value.length > length) {
                return "الحدد المسموح $length";
              }
              return null;
            },
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: <TextInputFormatter>[filteringTextInput],
          ),
        )
      ],
    );
  }

  Widget _buildAlertDialogContent() {
    return Column(
      children: <Widget>[
        _buildRow(controller: expenNameController!, columnName: 'اسم الصتف', filteringTextInput: FilteringTextInputFormatter.deny(RegExp(r'\d')), length: 5),
      ],
    );
  }

  /// Editing the DataGridRow
  void _handleEditWidgetTap(DataGridRow row, BuildContext context) {
    _updateTextFieldContext(row);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        scrollable: true,
        alignment: Alignment.center,
        title: const Center(child: Text('تعديل السيارة', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
        actions: _buildActionButtons(row, context),
        content: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Form(
              key: _formKey,
              child: _buildAlertDialogContent(),
            ),
          ),
        ),
      ),
    );
  }

  _handleDeleteWidgetTap({required BuildContext context, required DataGridRow row}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          actionsPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
          contentPadding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
          title: const Text('هل تريد حذف الصنف ؟', style: TextStyle(fontSize: 18, color: Colors.red)),
          content:
              const Text('سيتم حذف بيانات الصنف بشكل كامل متأكد بتحذفها ؟', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
          actions: <Widget>[
            GFButton(
                size: 40,
                fullWidthButton: false,
                onPressed: () => Navigator.pop(context),
                text: "تراجع",
                textStyle: const TextStyle(fontSize: 13, fontFamily: "Tajawal"),
                shape: GFButtonShape.pills,
                color: Colors.blueGrey),
            GFButton(
                size: 40,
                fullWidthButton: false,
                onPressed: () => deleteTheCar(row: row, context: context),
                text: "حذف",
                textStyle: const TextStyle(fontSize: 13, fontFamily: "Tajawal"),
                shape: GFButtonShape.pills,
                color: Colors.red),
          ],
        );
      },
    );
  }
}



  // void deleteTheCar(int typeID, {required BuildContext context}) async {
  //   bool status = await expenseTypesRepositories.deletetype(typeID);
  //   if (status) {
  //     expenseList.removeWhere((element) => element.id == typeID);
  //     notifyListeners();
  //     Navigator.pop(context);
  //   }
  // }
// }
