import 'package:chatty_app/Screens/SignUp/Blocs/signup_bloc.dart';
import 'package:chatty_app/Screens/userprofile.dart';
import 'package:chatty_app/Widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({required this.context});
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  signUp() async {
    final state = context.read<SignUpBloc>().state;
    String email = state.email;
    String password = state.password;
    if (email == "" && password == "") {
      return UiHelper.CustomSnackBar("Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          firestore.collection("Users").doc(email).set({
            "Email": email,
          }).then((value) {
            return Get.to(UserProfile());

          });
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomSnackBar(ex.code.toString());
      }
    }
  }
}
