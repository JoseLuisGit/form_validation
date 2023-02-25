import 'package:flutter/material.dart';
import 'package:form_validation/widgets/auth_background.dart';
import 'package:form_validation/widgets/card_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Login', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}