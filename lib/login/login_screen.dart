import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 48.0),
            _buildEmailTextField(),
            const SizedBox(height: 8.0),
            _buildPasswordTextField(),
            const SizedBox(height: 24.0),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
  return ElevatedButton(
    child: const Text('LOGIN'),
    onPressed: () {
      // Implement your login logic here
    },
  );
}
}