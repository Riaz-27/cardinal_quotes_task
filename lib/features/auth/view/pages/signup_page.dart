import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/core/widgets/custom_field.dart';
import 'package:cardinal_quotes_task/features/auth/view/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isObscureConfirm = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppPalette.color1,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -25,
              right: -44,
              child: Opacity(
                opacity: 0.44,
                child: Image.asset(
                  'assets/images/bird.png',
                  fit: BoxFit.cover,
                  height: 263,
                  width: 263,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: -12,
              child: Image.asset(
                'assets/images/fench1.png',
                fit: BoxFit.contain,
                height: 250,
                width: deviceSize.width + 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sign Up'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              LoginPage.route(),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPalette.color1,
                            foregroundColor: AppPalette.color3,
                          ),
                          child: const Text('Log In'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomField(
                      hintText: 'Enter your username',
                      controller: usernameController,
                    ),
                    const SizedBox(height: 25),
                    CustomField(
                      hintText: 'Create A Password',
                      controller: passwordController,
                      isObscureText: isObscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomField(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
                      isObscureText: isObscureConfirm,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscureConfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscureConfirm = !isObscureConfirm;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomField(
                      hintText: 'Enter your email address',
                      controller: emailController,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
