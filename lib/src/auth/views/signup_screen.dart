import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/auth/auth_controller.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/custom_input_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';

  SignUpScreen({Key? key}) : super(key: key);

  final _authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
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
                child: ListView(
                  children: [
                    const SizedBox(height: 28.0),
                    Image.asset('assets/images/logo.png'),
                    Text(
                      'Sign up to find work you love',
                      style: kTitleStyle.copyWith(fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28.0),
                    // _buildDividerView(),

                    CustomInputField(
                      hintText: 'First Name',
                      controller: _firstNameController,
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16.0),

                    CustomInputField(
                      hintText: 'Last Name',
                      controller: _lastNameController,
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16.0),

                    CustomInputField(
                      hintText: 'Email',
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _mobileNoController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: '+92',
                        contentPadding: const EdgeInsets.only(left: 12.0, top: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          borderSide: const BorderSide(width: 1.0, color: Colors.red),
                        ),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 16.0),

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
                    const SizedBox(height: 18.0),
                    CustomAsyncBtn(
                      btnTxt: 'Create my account',
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
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
