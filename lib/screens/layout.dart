import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/cars/cars_layout.dart';
import 'package:cars_expense_management/screens/expense_types/expense_types_layout.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 1:
        return const BillsLayout();
      case 2:
        return const CarsLayout();
      case 3:
        return const ExpenseTypesLayout();
      case 4:
        return const SettingsScrren();
      default:
        return const HomeScreen();
    }
  }

  onTabIcon(index) async {
    HapticFeedback.selectionClick();
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBrand.backgroundColor,
      restorationId: "7",
      extendBody: true,
      drawerScrimColor: AppBrand.drawerButtonColor,
      endDrawerEnableOpenDragGesture: true,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            SideMenu(tab: onTabIcon, indexPage: _selectedIndex),

            // const VerticalDivider(thickness: 0.2, width: 3, color: Colors.grey),
            Expanded(flex: 5, child: _getPage(_selectedIndex)),
          ],
        ),
      ),
    );
  }
}
