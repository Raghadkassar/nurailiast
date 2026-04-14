import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/input_mni/view/input_bmi_view.dart';

import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class SingupView extends StatelessWidget {
  SingupView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwrdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordretleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.color3,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTxtfield(
                  hint: "name ",
                  isPassword: false,
                  controller: nameController,
                ),
                Gap(25),
                CustomTxtfield(
                  hint: "email ",
                  isPassword: false,
                  controller: emailController,
                ),
                Gap(25),
                CustomTxtfield(
                  hint: "password ",
                  isPassword: true,
                  controller: passwrdController,
                ),
                Gap(25),
                CustomTxtfield(
                  hint: "password ",
                  isPassword: true,
                  controller: passwordretleController,
                ),
                Gap(25),
                CustomButton(
                  text: "Sign up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputBmiView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
