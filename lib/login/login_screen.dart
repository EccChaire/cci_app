import 'package:cci_app/config.dart';
import 'package:cci_app/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: getProportionateScreenWidth(150),
            height: getProportionateScreenHeight(150),
          ),
           SizedBox(height: getProportionateScreenHeight(48)),
          _buildEmailTextField(),
           SizedBox(height: getProportionateScreenHeight(8)),
          _buildPasswordTextField(),
           SizedBox(height: getProportionateScreenHeight(24)),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(24)),
      child: TextField(
        controller: mail,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(24)),
      child: TextField(
        controller: password,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      child:  Text('LOGIN',textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
      onPressed: () {
        loginController.login(mail.text, password.text);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0F8A74)), // set background color
        minimumSize: MaterialStateProperty.all<Size>(Size(getProportionateScreenWidth(250), getProportionateScreenHeight(50))), // set minimum size
        // You can also use fixedSize property to set the exact button size
      ),
    );
  }
}
