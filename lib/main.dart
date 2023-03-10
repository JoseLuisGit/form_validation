import 'package:flutter/material.dart';
import 'package:form_validation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'home' : (context) => const HomePage()
      },
    );
  }
}
