import 'package:cars_expense_management/library.dart';
import 'package:cars_expense_management/screens/cars/cars_layout.dart';
import 'package:cars_expense_management/screens/expense_types/expense_types_layout.dart';
import 'package:flutter_svg/svg.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  bool isdone = false;

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
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppBrand.backgroundColor,
      restorationId: "7",
      extendBody: true,
      drawerScrimColor: AppBrand.drawerButtonColor,
      endDrawerEnableOpenDragGesture: true,
      body: SafeArea(
        child: !isdone
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Center(child: SizedBox(height: 350, child: SvgPicture.asset("assets/icons/logo.svg", height: 350)).animate().scale())
                            .animate(onComplete: (control) {
                              isdone = true;
                              setState(() {});
                            })
                            .shimmer(delay: 100.ms, duration: 1800.ms) // shimmer +
                            .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
                            .scaleX(begin: 1.0, end: 1.1, duration: 600.ms) // scale up
                            .then(delay: 600.ms) // then wait and
                            .scaleX(begin: 1.0, end: 1 / 1.1),
                      ), // scale down,
                      Expanded(
                        flex: 3,
                        child: const Text(
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          "إدارة مصاريف السيارات",
                          style: TextStyle(fontSize: 60),
                        ).animate().scale(
                              delay: 400.ms,
                            ),
                      )

                      // const VerticalDivider(thickness: 0.2, width: 3, color: Colors.grey),
                    ],
                  ),
                ),
              )
            : Row(
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
