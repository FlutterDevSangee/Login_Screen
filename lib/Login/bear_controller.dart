import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBearController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var formkey = GlobalKey<FormState>();

  String correctPassword = 'admin';
  String animationType = 'idle';

  final passwordController = TextEditingController();

  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  bool iconCheckeduser = true;
  bool iconCheckedpass = true;
  @override
  void onInit() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        animationType = 'hands_up';
        update();
      } else {
        animationType = 'hands_down';
        update();
      }
    });

    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        animationType = 'test';
        update();
      } else {
        animationType = 'idle';
        update();
      }
    });

    super.onInit();
  }

//----------------- Adding
  void signIn() {
    if (animationType == 'hands_up') {
      animationType = 'hands_down';
      update();
    }

    if (passwordController.text.compareTo(correctPassword) == 0) {
      animationType = "success";
      update();
    } else {
      animationType = "fail";
      update();
    }
  }
}
