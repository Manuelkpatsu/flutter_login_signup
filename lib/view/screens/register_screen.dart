import 'package:authuiapp/utils/auth_colors.dart';
import 'package:authuiapp/utils/validator.dart';
import 'package:authuiapp/view/screens/login_screen.dart';
import 'package:authuiapp/view/widgets/back_button.dart';
import 'package:authuiapp/view/widgets/circular_icon_button.dart';
import 'package:authuiapp/view/widgets/password_input_field.dart';
import 'package:authuiapp/view/widgets/text_input_field.dart';
import 'package:authuiapp/view/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _showPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              color: AuthColors.pink,
              height: height,
            ),
          ),
          ClipPath(
            clipper: WaveClipper2(),
            child: Container(
              color: AuthColors.purple,
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
                      nameTextField(),
                      const SizedBox(height: 20),
                      emailTextField(),
                      const SizedBox(height: 20),
                      passwordTextField(),
                      const SizedBox(height: 30),
                      signUpButton(),
                      const SizedBox(height: 50),
                      signIn()
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
      "Create\nAccount",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget nameTextField() {
    return TextInputField(
      controller: nameController,
      inputAction: TextInputAction.next,
      inputType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      validator: Validator.name,
      labelText: 'Name',
      color: Colors.white,
    );
  }

  Widget emailTextField() {
    return TextInputField(
      controller: emailController,
      inputAction: TextInputAction.next,
      inputType: TextInputType.emailAddress,
      validator: Validator.email,
      labelText: 'Email',
      color: Colors.white,
    );
  }

  Widget passwordTextField() {
    return PasswordInputField(
      controller: passwordController,
      inputAction: TextInputAction.done,
      validator: Validator.password,
      obscureText: _showPassword,
      toggle: () => setState(() => _showPassword = !_showPassword),
      labelText: 'Password',
      color: Colors.white,
    );
  }

  Widget signUpButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sign up',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        CircularIconButton(
          color: AuthColors.purple,
          icon: Icons.arrow_forward,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              // ignore: avoid_print
              print('Successful!');
            }
          },
        )
      ],
    );
  }

  Widget signIn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(LoginScreen.routeName);
      },
      child: const Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
