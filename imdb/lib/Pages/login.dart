import '../firebase/auth.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xfffeca07),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello There! \n\nSign in with IMDb',
                textScaleFactor: 2.5,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                child: Column(
                  children: [
                    textFormField(
                      controller: email,
                      labletext: 'Email',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textFormField(
                      controller: password,
                      labletext: 'Password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    materialButton(
                      onPressed: () {
                        userLogin(
                          context,
                          email: email.text,
                          password: password.text,
                        );
                      },
                      text: 'Login',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text("Don't have an Account?",style: TextStyle(color: Colors.black),),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: const Text("Register!",style: TextStyle(color: Colors.white),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}