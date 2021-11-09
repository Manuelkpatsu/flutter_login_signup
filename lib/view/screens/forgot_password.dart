// ignore_for_file: avoid_print

import 'package:authuiapp/utils/auth_colors.dart';
import 'package:authuiapp/utils/validator.dart';
import 'package:authuiapp/view/screens/reset_password.dart';
import 'package:authuiapp/view/widgets/back_button.dart';
import 'package:authuiapp/view/widgets/rounded_button.dart';
import 'package:authuiapp/view/widgets/text_input_field.dart';
import 'package:authuiapp/view/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AuthColors.cream,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: AuthColors.blue,
              height: height,
            ),
          ),
          ClipPath(
            clipper: WaveClipper2(),
            child: Container(
              color: AuthColors.blueBlack,
              height: height * 0.5,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      title(),
                      const SizedBox(height: 10),
                      subTitle(),
                      const SizedBox(height: 40),
                      emailTextField(),
                      const SizedBox(height: 30),
                      forgotPasswordButton()
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: CustomBackButton(
              color: Colors.white,
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget title() {
    return const Text(
      "Forgot\nPassword",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget subTitle() {
    return const Text(
      'Please enter your email address.',
      style: TextStyle(color: Colors.white),
    );
  }

  Widget emailTextField() {
    return TextInputField(
      controller: emailController,
      inputAction: TextInputAction.done,
      inputType: TextInputType.emailAddress,
      validator: Validator.email,
      labelText: 'Email',
      color: Colors.white,
    );
  }

  Widget forgotPasswordButton() {
    return CustomRoundedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
        }
      },
      color: AuthColors.blueBlack,
      text: 'Submit',
    );
  }
}
