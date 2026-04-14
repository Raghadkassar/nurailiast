import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/root.dart';
import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class InputBmiView extends StatelessWidget {
  InputBmiView({super.key});
  TextEditingController ageContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTxtfield(
            hint: "age",
            isPassword: false,
            controller: ageContrller,
          ),
          Gap(25),
          CustomButton(
            text: "enter",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Root()),
            ),
          ),
        ],
      ),
    );
  }
}
