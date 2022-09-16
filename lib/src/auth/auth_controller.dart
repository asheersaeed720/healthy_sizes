import 'package:healthy_sizes/src/network_manager.dart';

class AuthController extends NetworkManager {
  // bool isAgree = false;
  bool isObscure = true;

  // void selectDropDownValue(String value) {
  //   dropDownValue = value;
  //   update();
  // }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  // void checkAgree() {
  //   isAgree = !isAgree;
  //   update();
  // }

  // //! Auth Service
  // bool isFromCompany = false;

  // bool appShouldRoute = true;
  // @override
  // void onInit() {
  //   isFromCompany = (GetStorage().read('isFromCompany') ?? false);
  //   log(isFromCompany.toString(), name: 'isFromCompany');

  //   FirebaseAuth.instance.authStateChanges().listen((event) {
  //     //! Route and send to relevant screen if not already routed
  //     if (appShouldRoute && event != null) {
  //       if (Get.find<AuthController>().isFromCompany) {
  //         Get.offAllNamed(CompanyMainScreen.routeName);
  //       } else {
  //         Get.offAllNamed(EmployeeMainScreen.routeName);
  //       }
  //     }
  //     appShouldRoute = false;
  //   });
  //   super.onInit();
  // }

  // attemptLogin(String email, String password) async {
  //   try {
  //     appShouldRoute = false;
  //     isFromCompany = (GetStorage().read('isFromCompany') ?? false); // Just re-check to make sure
  //     update();
  //     if (isFromCompany) {
  //       log("Is from Company");
  //       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       );
  //       if (userCredential.user != null) {
  //         await companyUserReference.doc(userCredential.user!.uid).get().then((res) async {
  //           log('res ${res.exists}');
  //           if (res.exists) {
  //             appShouldRoute = true;
  //             Get.offAllNamed(CompanyMainScreen.routeName);
  //             update();
  //           } else {
  //             await FirebaseAuth.instance.signOut();
  //             customSnackBar('Error', "This email address is registered as employee!");
  //             update();
  //           }
  //         }).catchError((e) {
  //           log('$e');
  //         });
  //       }
  //     } else if (!isFromCompany) {
  //       log("Is not from Company");
  //       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       );
  //       if (userCredential.user != null) {
  //         await employeeUserReference.doc(userCredential.user!.uid).get().then((res) async {
  //           log('res ${res.exists}');
  //           if (res.exists) {
  //             appShouldRoute = true;
  //             Get.offAllNamed(EmployeeMainScreen.routeName);
  //             update();
  //           } else {
  //             await FirebaseAuth.instance.signOut();
  //             customSnackBar('Error', "This email address is registered as Company");
  //             update();
  //           }
  //         }).catchError((e) {
  //           log('$e');
  //           displayToastMessage('$e');
  //         });
  //       } else {
  //         displayToastMessage('User not found!');
  //       }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       displayToastMessage('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       displayToastMessage('Wrong password');
  //     } else {
  //       log(e.message.toString());
  //       log(e.code);
  //     }
  //     update();
  //   } on TimeoutException catch (_) {
  //     update();
  //     customSnackBar('Error', 'Network error, please try again later');
  //   } on SocketException catch (_) {
  //     update();
  //     customSnackBar('Error', 'Network error, please try again later');
  //   } catch (e) {
  //     update();
  //     log(e.toString());
  //   }
  // }

  // Future<void> signUpUser(data) async {
  //   try {
  //     isFromCompany = (GetStorage().read('isFromCompany') ?? false); // Just re-check to make sure
  //     update();
  //     log('$isFromCompany', name: "isFromCompany");
  //     if (isFromCompany && (data is CompanyUser)) {
  //       CompanyUser companyUser = data;
  //       //! Company
  //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: companyUser.companyEmail,
  //         password: companyUser.password,
  //       );
  //       if (userCredential.user != null) {
  //         Map<String, dynamic> data = {
  //           "uid": userCredential.user!.uid,
  //           "name": companyUser.companyName,
  //           "first_name": companyUser.companyRepresentativeFName,
  //           "last_name": companyUser.companyRepresentativeLName,
  //           "email": companyUser.companyEmail,
  //           "contact_no": companyUser.companyContactNo,
  //           "fav_candidates": [],
  //           "is_approved": false,
  //         };
  //         await companyUserReference.doc(userCredential.user!.uid).set(data);
  //         FirebaseAuth.instance.currentUser!.updateDisplayName(companyUser.companyName);
  //         Get.offAllNamed(CompanyMainScreen.routeName);
  //         update();
  //       }
  //     } else if (!isFromCompany && (data is EmployeeUser)) {
  //       EmployeeUser employeeUser = data;
  //       //! Candidate
  //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: employeeUser.email,
  //         password: employeeUser.password,
  //       );
  //       if (userCredential.user != null) {
  //         log("Adding User to db");
  //         Map<String, dynamic> data = {
  //           "uid": userCredential.user!.uid,
  //           'first_name': employeeUser.firstName,
  //           'last_name': employeeUser.lastName,
  //           'contact_no': employeeUser.contactNo,
  //           'email': employeeUser.email,
  //           "employee_details": null,
  //         };
  //         await employeeUserReference.doc(userCredential.user!.uid).set(data);
  //         await userCredential.user!
  //             .updateDisplayName('${employeeUser.firstName} ${employeeUser.lastName}');
  //         Get.offAllNamed(EmployeeMainScreen.routeName);
  //         update();
  //       } else {
  //         log("User credential is null");
  //       }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       displayToastMessage('Password is too weak');
  //     } else if (e.code == 'email-already-in-use') {
  //       displayToastMessage('Email aleady exist');
  //     } else {
  //       log(e.message ?? '');
  //     }
  //     update();
  //   } on TimeoutException catch (_) {
  //     update();
  //     customSnackBar('Error', 'Network error, please try again later');
  //   } on SocketException catch (_) {
  //     update();
  //     customSnackBar('Error', 'Network error, please try again later');
  //   } catch (e) {
  //     update();
  //     rethrow;
  //   }
  // }

  // logout() async {
  //   await FirebaseAuth.instance.signOut();
  //   Get.offAllNamed(InitialScreen.routeName);
  // }
}
