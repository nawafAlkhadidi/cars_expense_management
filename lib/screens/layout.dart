import 'package:cars_expense_management/library.dart';

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
        return const CarsScreen();
      case 3:
        return const ExpenseTypesScreen();
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
      drawerEdgeDragWidth: 200,
      restorationId: "7",
      drawer: SideMenu(
        tab: onTabIcon,
        indexPage: _selectedIndex,
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(
                tab: onTabIcon,
                indexPage: _selectedIndex,
              ),
            ),

            // const VerticalDivider(thickness: 0.4, width: 1),
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
