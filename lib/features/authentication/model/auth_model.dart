import 'package:flutter/material.dart';

class AuthModel {
  final TabController? tabController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  bool isPasswordVisible;

  AuthModel({
    this.tabController,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    this.isPasswordVisible = false,
  });

  void dispose() {
    tabController?.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
} 