import 'package:chatter/features.auth/presentation/widgets/auth_button.dart';
import 'package:chatter/features.auth/presentation/widgets/auth_input_field.dart';
import 'package:chatter/features.auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:chatter/core/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues() {
    String email = _emailController.text;
    String password = _passwordController.text;

    print("Email : $email - Password :$password");
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(
                hint: 'Email',
                icon: Icons.person,
                controller: _emailController,
              ),
              SizedBox(height: 20),
              AuthInputField(
                hint: 'Password',
                icon: Icons.password,
                controller: _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 20),
              AuthButton(text: 'Login', onPressed: () {}),
              SizedBox(height: 20),
              LoginPrompt(
                title: 'New User? ',
                subtitle: 'Click here to register',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
