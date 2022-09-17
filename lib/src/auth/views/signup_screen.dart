import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/auth_controller.dart';
import 'package:healthy_sizes/src/auth/views/login_screen.dart';
import 'package:healthy_sizes/src/main/main_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/custom_input_field.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';

  SignUpScreen({super.key});

  final AuthController _authCtrl = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ScreenBgWidget(),
            Positioned(
              top: 170.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          "Sign Up",
                          style: kBodyStyle.copyWith(fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      const Center(
                        child: Text(
                          "Fill information to create Account",
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      CustomInputField(
                        hintText: 'User Name',
                        controller: _nameController,
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 18.0),
                      CustomInputField(
                        hintText: 'Email',
                        controller: _emailController,
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18.0),
                      CustomInputField(
                        hintText: 'Phone Number',
                        controller: _phoneNoController,
                        prefixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 18.0),
                      GetBuilder<AuthController>(
                        builder: (_) => CustomInputField(
                          hintText: 'Password',
                          controller: _passwordController,
                          prefixIcon: const Icon(Icons.lock),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _authCtrl.isObscure,
                          suffixIcon: InkWell(
                            onTap: () {
                              _authCtrl.toggleObscure();
                            },
                            child: _authCtrl.isObscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      CustomAsyncBtn(
                        width: MediaQuery.of(context).size.width * 0.8,
                        btnTxt: 'Sign Up',
                        onPress: () {
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          //   FocusScopeNode currentFocus = FocusScope.of(context);
                          //   if (!currentFocus.hasPrimaryFocus) {
                          //     currentFocus.unfocus();
                          //   }
                          // }
                          Get.toNamed(MainScreen.routeName);
                        },
                      ),
                      const SizedBox(height: 18.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: kBodyStyle,
                          ),
                          const SizedBox(width: 6.0),
                          InkWell(
                            onTap: () {
                              Get.toNamed(LogInScreen.routeName);
                            },
                            child: Text(
                              'Log In',
                              style: kBodyStyle.copyWith(color: Colors.deepOrange.shade500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
