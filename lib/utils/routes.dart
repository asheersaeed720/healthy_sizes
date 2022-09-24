import 'package:get/get.dart';
import 'package:healthy_sizes/src/appointment/appointment_screen.dart';
import 'package:healthy_sizes/src/auth/views/forgot_password_screen.dart';
import 'package:healthy_sizes/src/auth/views/login_screen.dart';
import 'package:healthy_sizes/src/auth/views/signup_screen.dart';
import 'package:healthy_sizes/src/diet/diet_plan_screen.dart';
import 'package:healthy_sizes/src/exercise/exercise_screen.dart';
import 'package:healthy_sizes/src/fitness/fitness_plan_screen.dart';
import 'package:healthy_sizes/src/init_screen.dart';
import 'package:healthy_sizes/src/main/main_screen.dart';
import 'package:healthy_sizes/src/meditation/meditation_plan_screen.dart';
import 'package:healthy_sizes/src/plan_detail/plan_detail_screen.dart';
import 'package:healthy_sizes/src/step_count/step_count_screen.dart';
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
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: MainScreen.routeName,
    page: () => MainScreen(),
  ),
  GetPage(
    name: FitnessPlanScreen.routeName,
    page: () => FitnessPlanScreen(),
  ),
  GetPage(
    name: DietPlanScreen.routeName,
    page: () => DietPlanScreen(),
  ),
  GetPage(
    name: MeditationPlanScreen.routeName,
    page: () => MeditationPlanScreen(),
  ),
  GetPage(
    name: PlanDetailScreen.routeName,
    page: () => PlanDetailScreen(),
  ),
  GetPage(
    name: ExerciseScreen.routeName,
    page: () => ExerciseScreen(),
  ),
  GetPage(
    name: StepCountScreen.routeName,
    page: () => StepCountScreen(),
  ),
  GetPage(
    name: AppointmentScreen.routeName,
    page: () => AppointmentScreen(),
  ),
];
