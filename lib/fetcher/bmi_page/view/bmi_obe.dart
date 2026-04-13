import 'package:flutter/material.dart';

class BmiObe extends StatelessWidget {
  const BmiObe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset("assets/food.jpg", fit: BoxFit.cover)),
      ],
    );
  }
}
