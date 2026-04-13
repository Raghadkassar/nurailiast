import 'package:flutter/material.dart';

import 'package:projecttt/fetcher/auth/view/sinup_view.dart';

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
      home: SingupView(),
    );
  }
}
