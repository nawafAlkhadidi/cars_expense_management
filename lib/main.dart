import 'dart:io';

import 'library.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService().database;
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("برنامج ادارة مصاريف السيارات");
    // setWindowVisibility(visible: false);
    // setWindowMaxSize(const Size(2200, 1900));
    // setWindowMinSize(const Size(700, 600));
    setWindowMinSize(const Size(900, 600));
  }
  setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: AppBrand.mainColor),
        fontFamily: "Tajawal",
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Tajawal"),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Tajawal"),
          labelSmall: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "Tajawal"),
          titleLarge: TextStyle(color: Colors.black, fontFamily: "Tajawal", fontSize: 25),
          titleSmall: TextStyle(color: Colors.black, fontFamily: "Tajawal"),
          titleMedium: TextStyle(color: Colors.deepOrange, fontFamily: "Tajawal"),
        ),
        dialogTheme: const DialogTheme(
            backgroundColor: AppBrand.backgroundColor,
            surfaceTintColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Tajawal")),
        appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
            centerTitle: false,
            toolbarHeight: 100,
            color: AppBrand.backgroundColor,
            titleTextStyle: TextStyle(color: Colors.black, fontFamily: "Tajawal", fontSize: 30)),
        useMaterial3: true,
      ),
      //  home: const HomeScreen(),
    );
  }
}
