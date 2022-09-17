import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthy_sizes/src/initial_binding.dart';
import 'package:healthy_sizes/src/main/main_screen.dart';
import 'package:healthy_sizes/utils/app_theme.dart';
import 'package:healthy_sizes/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    // systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Healthy Sizes',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        initialBinding: InitialBinding(),
        // initialRoute: InitialScreen.routeName,
        home: const MainScreen(),
        getPages: routes,
      );
}
