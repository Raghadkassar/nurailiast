
import 'package:flutter/material.dart';

import 'package:projecttt/core/const/app_color.dart';

class SplashView extends StatelessWidget { 
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Image.asset('assets/logo/food.jpg'),
      ],),
    );
  }
}