import 'library.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService().database;

  await windowManager.ensureInitialized();
  WindowManager.instance.setMinimizable(false);
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 650),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    title: "إدارة مصاريف السيارات",
    titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
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
          labelSmall: TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Tajawal"),
          labelMedium: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Tajawal"),
          labelLarge: TextStyle(color: Colors.black, fontSize: 18, fontFamily: "Tajawal"),
          titleLarge: TextStyle(color: Colors.black, fontFamily: "Tajawal", fontSize: 20),
          titleSmall: TextStyle(color: Colors.black, fontFamily: "Tajawal", fontSize: 16),
          titleMedium: TextStyle(color: Colors.deepOrange, fontFamily: "Tajawal", fontSize: 18),
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
    );
  }
}
