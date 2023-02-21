import 'package:flutter/material.dart';
import 'package:form_validation/widgets/auth_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground()
    );
  }
}