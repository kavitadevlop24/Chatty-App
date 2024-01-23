import 'package:chatty_app/Screens/SignUp/Blocs/signup_bloc.dart';
import 'package:chatty_app/Screens/SignUp/Blocs/signup_events.dart';
import 'package:chatty_app/Screens/SignUp/Blocs/signup_states.dart';
import 'package:chatty_app/Screens/SignUp/signupcontroller.dart';
import 'package:chatty_app/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up Screen"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField("Enter Email", false, (value) {
              context.read<SignUpBloc>().add(EmailEvents(email: value));
            }, Icons.mail),
            UiHelper.CustomTextField("Enter Password", true, (value) {
              context.read<SignUpBloc>().add(PasswordEvents(password: value));
            }, Icons.password),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              SignUpController(context: context).signUp();
            }, child: const Text("Sign Up"))
          ],
        ),
      );
    });
  }
}
