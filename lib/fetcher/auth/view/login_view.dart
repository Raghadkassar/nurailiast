import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/auth/view/sinup_view.dart';
import 'package:projecttt/fetcher/input_mni/view/input_bmi_view.dart';
import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InputBmiView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.color1,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.color3,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.color2.withValues(alpha: 0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 34,
                          backgroundColor: AppColor.color2,
                          child: Icon(
                            Icons.person,
                            color: AppColor.color3,
                            size: 34,
                          ),
                        ),
                      ),
                      const Gap(22),
                      CustomText(
                        text: "Log In",
                        color: AppColor.color2,
                        size: 26,
                        fontWeight: FontWeight.w700,
                      ),
                      const Gap(8),
                      CustomText(
                        text: "Enter your account information",
                        color: AppColor.color2,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(26),
                      CustomTxtfield(
                        hint: "email",
                        isPassword: false,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(18),
                      CustomTxtfield(
                        hint: "password",
                        isPassword: true,
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        textInputAction: TextInputAction.done,
                      ),
                      const Gap(24),
                      CustomButton(
                        text: "Log In",
                        color: AppColor.color2,
                        width: double.infinity,
                        onTap: _login,
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: CustomText(
                              text: "If you don't have an account",
                              color: AppColor.color2,
                              size: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SingupView(),
                                ),
                              );
                            },
                            child: CustomText(
                              text: "Sign up",
                              color: AppColor.color4,
                              size: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
