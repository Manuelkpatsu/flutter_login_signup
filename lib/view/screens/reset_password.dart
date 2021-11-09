import 'package:authuiapp/utils/auth_colors.dart';
import 'package:authuiapp/utils/validator.dart';
import 'package:authuiapp/view/widgets/back_button.dart';
import 'package:authuiapp/view/widgets/password_input_field.dart';
import 'package:authuiapp/view/widgets/rounded_button.dart';
import 'package:authuiapp/view/widgets/text_input_field.dart';
import 'package:authuiapp/view/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/reset_password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _showPassword = true;

  @override
  void dispose() {
    codeController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AuthColors.deepYellow,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: AuthColors.blueBlack,
              height: height,
            ),
          ),
          ClipPath(
            clipper: WaveClipper2(),
            child: Container(
              color: AuthColors.blue,
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
                      const SizedBox(height: 40),
                      codeTextField(),
                      const SizedBox(height: 20),
                      passwordTextField(),
                      const SizedBox(height: 30),
                      resetPasswordButton(),
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
      "Reset Your\nPassword",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget codeTextField() {
    return TextInputField(
      controller: codeController,
      inputAction: TextInputAction.next,
      inputType: TextInputType.number,
      validator: Validator.code,
      labelText: 'Code',
      color: Colors.white,
    );
  }

  Widget passwordTextField() {
    return PasswordInputField(
      controller: newPasswordController,
      inputAction: TextInputAction.done,
      validator: Validator.password,
      obscureText: _showPassword,
      toggle: () => setState(() => _showPassword = !_showPassword),
      labelText: 'New Password',
      color: Colors.white,
    );
  }

  Widget resetPasswordButton() {
    return CustomRoundedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          Navigator.of(context).pushNamed(LoginScreen.routeName);
        }
      },
      color: AuthColors.blue,
      text: 'Reset Password',
    );
  }
}
