import 'package:cars_expense_management/library.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  final Function tab;
  final int indexPage;
  const SideMenu({
    Key? key,
    required this.tab,
    required this.indexPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: AppBrand.mainColor,
      backgroundColor: AppBrand.mainColor,
      // width: 900,
      semanticLabel: "7777",
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  // color: Colors.amber,
                  child: SvgPicture.asset(
                    "assets/icons/car.svg",
                    height: 100,
                  ),
                ),
                // DrawerHeader(

                DrawerListTile(
                  title: "الرئيسية",
                  svgSrc: "assets/icons/home.svg",
                  press: () => tab(0),
                  isColor: 0 == indexPage,
                ),
                DrawerListTile(
                  title: "الفواتير",
                  svgSrc: "assets/icons/bill.svg",
                  press: () => tab(1),
                  isColor: 1 == indexPage,
                ),
                DrawerListTile(
                  title: "السيارات",
                  svgSrc: "assets/icons/add.svg",
                  press: () => tab(2),
                  isColor: 2 == indexPage,
                ),
                DrawerListTile(
                  title: "المصاريف",
                  svgSrc: "assets/icons/add.svg",
                  press: () => tab(3),
                  isColor: 3 == indexPage,
                ),
                DrawerListTile(
                  title: "الإعدادات",
                  svgSrc: "assets/icons/settings.svg",
                  press: () => tab(4),
                  isColor: 4 == indexPage,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Align(
                alignment: Alignment.center,
                child: Center(
                    child: Text(
                  "برمجة : نواف الخديدي" "\n" "NawafAlkhadidi@",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ))),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
      // For selecting those three line once press "Command+D"
      required this.title,
      required this.svgSrc,
      required this.press,
      required this.isColor})
      : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            //    color: isColor ? AppBrand.drawerButtonColor : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            colorFilter: ColorFilter.mode(isColor ? AppBrand.drawerButtonColor : Colors.white, BlendMode.srcIn),
            height: 25,
          ),
          title: Padding(
              padding: const EdgeInsets.only(top: 5, right: 15),
              child: Text(title, style: TextStyle(color: isColor ? AppBrand.drawerButtonColor : Colors.white, fontSize: 19))),
        ),
      ),
    );
  }
}
