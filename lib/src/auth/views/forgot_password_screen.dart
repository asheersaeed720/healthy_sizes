import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/auth_controller.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/custom_input_field.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot-password';

  ForgotPasswordScreen({super.key});

  final AuthController _authCtrl = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
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
                          "Forgot Password",
                          style: kBodyStyle.copyWith(fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      const Center(
                        child: Text(
                          "Send new password at your email",
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      CustomInputField(
                        hintText: 'Email',
                        controller: _emailController,
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18.0),
                      CustomAsyncBtn(
                        width: MediaQuery.of(context).size.width * 0.8,
                        btnTxt: 'Submit',
                        onPress: () {
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          //   FocusScopeNode currentFocus = FocusScope.of(context);
                          //   if (!currentFocus.hasPrimaryFocus) {
                          //     currentFocus.unfocus();
                          //   }
                          // }
                        },
                      ),
                      const SizedBox(height: 18.0),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1.7),
                              child: Icon(Icons.arrow_back, color: Colors.deepOrange.shade500),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'Go back',
                              style: kBodyStyle,
                            ),
                            const SizedBox(width: 6.0),
                          ],
                        ),
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
