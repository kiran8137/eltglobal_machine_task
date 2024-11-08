import 'package:elt_global_machine_task/data/respository/auth_repo_implement.dart';
import 'package:elt_global_machine_task/presentation/auth_screen/login_screen.dart';
import 'package:elt_global_machine_task/presentation/statemanagment/auth_bloc/auth_bloc.dart';
import 'package:elt_global_machine_task/presentation/widgets_component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

      

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthInitial){
              Center(child: CircularProgressIndicator());
            }
            if(state is AuthSuccessState){
              context.go('/homescreen');
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) => Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textFormField(
                        labelText: 'Username',
                        hintText: 'Enter your name',
                        constraints: constraints,
                        isObscureNeed: false,
                        controller: userNameController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Enter a valid name';
                          }
                        }), // textformfield extracted as method component
                    const SizedBox(height: 15),
                    textFormField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      constraints: constraints,
                      isObscureNeed: true,
                      controller: passwordController,
                      validator: (value) {
                        final regExp = RegExp(r'^\d+$');
                        if (!regExp.hasMatch(value!)) {
                          return "Password must be at least 8 characters long, include "
                              "an uppercase letter, a lowercase letter, a number, and a special character";
                        }
                      },
                    ), // textformfield extracted as method component
                    const SizedBox(height: 15),
                    textFormField(
                      labelText: 'Confirm password',
                      hintText: 'Confirm your password',
                      constraints: constraints,
                      isObscureNeed: true,
                      controller: confirmPasswordController,
                      validator: (value) {
                        final regExp = RegExp(r'^\d+$');
                        if (!regExp.hasMatch(value!)) {
                          return "Password must be at least 8 characters long, include "
                              "an uppercase letter, a lowercase letter, a number, and a special character";
                        }
                      },
                    ), // textformfield extracted as method component
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          debugPrint('password doesnt match');
                        } else {
                          if (formKey.currentState!.validate()) {
                            debugPrint('logined');
                            BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                    userName: userNameController.text,
                                    password: passwordController.text));
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        width: constraints.maxWidth < 600
                            ? 300
                            : constraints.maxHeight < 600
                                ? 300
                                : 500,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
