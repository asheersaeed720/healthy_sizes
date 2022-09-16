import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/views/login_screen.dart';
import 'package:healthy_sizes/src/init_screen.dart';
import 'package:healthy_sizes/src/welcome_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: InitialScreen.routeName,
    page: () => InitialScreen(),
  ),
  GetPage(
    name: WelcomeAuthScreen.routeName,
    page: () => WelcomeAuthScreen(),
  ),
  GetPage(
    name: LogInScreen.routeName,
    page: () => LogInScreen(),
  ),
];
