import 'package:ecommerceapp/loginsignup/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/widgets/custombutton.dart';
import 'package:ecommerceapp/widgets/loginsignupcard.dart';
import 'package:ecommerceapp/widgets/textformfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const LoginSignupCard(
                image: 'assets/images/login/pair-trainers_144627-3798.jpg',
                title: "Welcome Back!",
                description: "Enter your email and password",
              ),
              CustomTextFormField(
                hintText: 'Enter your Username',
                icon: Icons.person,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or username';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Email or Username',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or username';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Password',
                icon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: size.height * 0.02),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  // Implement login logic
                },
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait ? 16 : 14,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => const LoginPage()),);

                      },
                      child: Text(
                        " Login ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: orientation == Orientation.portrait ? 16 : 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
