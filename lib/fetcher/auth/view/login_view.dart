import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/auth/view/sinup_view.dart';
import 'package:projecttt/fetcher/input_mni/view/input_bmi_view.dart';

import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.color1,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTxtfield(
                  hint: "email",
                  isPassword: false,
                  controller: emailController,
                ),
                Gap(25),
                CustomTxtfield(
                  hint: "password",
                  isPassword: true,
                  controller: passwordController,
                ),
                Gap(25),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputBmiView()),
                  ),
                  child: CustomButton(text: "Log In "),
                ),
                Gap(25),
                Row(
                  children: [
                    CustomText(text: "ndrjvknerov"),
                    Gap(20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SingupView()),
                        );
                      },
                      child: CustomButton(text: "Sign In "),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
