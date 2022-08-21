import 'package:flutter/material.dart';
import 'package:flutter_getx_template/theme/app_themes.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'common/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Urgent Manager",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INIT,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      debugShowMaterialGrid: false,
      darkTheme: AppThemes.dark,
      theme: AppThemes.light,
      themeMode: ThemeMode.system,
      navigatorObservers: [
        FlutterSmartDialog.observer,
      ],
      builder: FlutterSmartDialog.init(),
    );
  }
}

