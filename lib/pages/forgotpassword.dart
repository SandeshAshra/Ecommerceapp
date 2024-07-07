import 'package:ecommerceapp/utils/extension.dart';
import 'package:ecommerceapp/widgets/custombutton.dart';
import 'package:ecommerceapp/widgets/loginsignupcard.dart';
import 'package:ecommerceapp/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const LoginSignupCard(
                  image: 'assets/images/login/forgotpassword.jpg',
                  title: "Forgot your password?",
                  description: "Please confirm your email and we will send you a verification code.",
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFormField(
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!value!.isValidEmail) {
                      return 'Please enter vaild email';
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                SizedBox(height: size.height * 0.02),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    // Implement login logic
                  },
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
