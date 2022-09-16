import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/auth_controller.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/custom_input_field.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = '/login';

  LogInScreen({Key? key}) : super(key: key);

  final _authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 18.0),
                    Center(
                      child: Image.asset('assets/icons/logo.png'),
                    ),
                    // Text(
                    //   'Sign up to find work you love',
                    //   style: kTitleStyle.copyWith(fontSize: 24.0),
                    //   textAlign: TextAlign.center,
                    // ),
                    // const SizedBox(height: 28.0),
                    const SizedBox(height: 20.0),
                    CustomInputField(
                      hintText: 'Email',
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),
                    GetBuilder<AuthController>(
                      builder: (_) => CustomInputField(
                        hintText: 'Password',
                        controller: _passwordController,
                        prefixIcon: const Icon(Icons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _authController.isObscure,
                        suffixIcon: InkWell(
                          onTap: () {
                            _authController.toggleObscure();
                          },
                          child: _authController.isObscure
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Container(
                    //   margin: const EdgeInsets.only(right: 18.0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Get.toNamed(ForgotPasswordScreen.routeName);
                    //     },
                    //     child: Text(
                    //       'Forgot Password?',
                    //       style: kBodyStyle.copyWith(
                    //         color: kPrimaryColor,
                    //         decoration: TextDecoration.underline,
                    //       ),
                    //       textAlign: TextAlign.right,
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 20.0),
                    CustomAsyncBtn(
                      btnTxt: 'Log In',
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 18.0),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 14.0,
              child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
