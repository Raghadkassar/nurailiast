import 'package:flutter/material.dart';

class BmiMod extends StatelessWidget {
  const BmiMod({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
       Expanded(child: Image.asset("assets/food.jpg", fit: BoxFit.cover)),
    ],);
  }
}
