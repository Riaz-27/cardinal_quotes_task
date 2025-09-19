import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:cardinal_quotes_task/core/widgets/custom_field.dart';
import 'package:cardinal_quotes_task/features/auth/view/pages/signup_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/home_nav_page.dart';
import 'package:cardinal_quotes_task/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                width: deviceSize.width + 24,
                height: 250,
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
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              SignupPage.route(),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPalette.color1,
                            foregroundColor: AppPalette.color3,
                          ),
                          child: const Text('Sign Up'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Log In'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomField(
                      hintText: 'Enter your email address',
                      controller: emailController,
                    ),
                    const SizedBox(height: 25),
                    CustomField(
                      hintText: 'Enter your password',
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
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          HomeNavPage.route(),
                          (route) => false,
                        );
                      },
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
