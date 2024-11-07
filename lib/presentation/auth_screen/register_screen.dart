import 'package:elt_global_machine_task/presentation/auth_screen/login_screen.dart';
import 'package:elt_global_machine_task/presentation/common_widgets_component/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormField(labelText: 'Username', hintText: 'Enter your name'),
            const SizedBox(height: 15),
            textFormField(labelText: 'Password', hintText: 'Enter your password'),
             const SizedBox(height: 15),
            textFormField(labelText: 'Confirm password', hintText: 'Confirm your password')
          ],
        ),
      ),
    );
  }

}