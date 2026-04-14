import 'package:flutter/material.dart';
import 'package:projecttt/fetcher/auth/view/login_view.dart';

import 'package:projecttt/fetcher/auth/view/sinup_view.dart';
import 'package:projecttt/fetcher/bmi_page/view/bmi_mod.dart';

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
      title: "food app",
      home: LoginView(),
    );
  }
}
