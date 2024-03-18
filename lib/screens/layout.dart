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
      // drawerEdgeDragWidth: 250,
      restorationId: "7",
      // drawerEnableOpenDragGesture: false
      extendBody: true,
      drawerScrimColor: AppBrand.drawerButtonColor,
      endDrawerEnableOpenDragGesture: true,
      // drawer: SideMenu(tab: onTabIcon, indexPage: _selectedIndex),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            SideMenu(tab: onTabIcon, indexPage: _selectedIndex),
            // Expanded(
            //   // default flex = 1
            //   flex: 1.,
            //   // and it takes 1/6 part of the screen
            //   child: SideMenu(
            //     tab: onTabIcon,
            //     indexPage: _selectedIndex,
            //   ),
            // ),

            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              flex: 5,
              child: _getPage(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}
