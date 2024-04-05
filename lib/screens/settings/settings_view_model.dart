import 'dart:io';

import 'package:cars_expense_management/library.dart';

final settingViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => locator<SettingViewModel>());

class SettingViewModel extends ChangeNotifier {
  void deleteCarTable({required BuildContext context}) {
    locator<DatabaseService>().dropAllTables().then((value) => Navigator.pop(context));
  }

  void getDatabasesFile() async {
    String path = await getDatabasesPath();
    Process.run("open", [path], workingDirectory: path);
  }

  handleDeleteWidget({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          actionsPadding: const EdgeInsets.only(bottom: 10, top: 20, right: 0, left: 0),
          contentPadding: const EdgeInsets.fromLTRB(23, 15, 23, 0),
          title: const Text("تأكيد الحذف !", style: TextStyle(fontSize: 18, color: Colors.red)),
          content: const Text('سيتم حذف جميع البيانات هل أنت متأكد ؟', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
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
                onPressed: () => deleteCarTable(context: context),
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
