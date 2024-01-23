import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class UiHelper {
  static CustomTextField(String text, bool toHide,
      void Function(String value)? func, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        onChanged: (value) => func!(value),
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))),
      ),
    );
  }

  static CustomSnackBar(String text) {
    return Get.showSnackbar(GetSnackBar(
      title: text,
      backgroundColor: Colors.blueGrey.withOpacity(.2),
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}
