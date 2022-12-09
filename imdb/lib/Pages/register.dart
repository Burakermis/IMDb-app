import '../firebase/auth.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfffeca07),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register \nAn Account!',
              textScaleFactor: 2.5,
            ),
            const SizedBox(
              height: 35,
            ),
            Form(
              child: Column(
                children: [
                  textFormField(
                    controller: name,
                    labletext: 'Name',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                      userRegister(context,
                          email: email.text, password: password.text);
                    },
                    text: 'Register',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}