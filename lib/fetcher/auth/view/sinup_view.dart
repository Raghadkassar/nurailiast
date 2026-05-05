import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/input_mni/view/input_bmi_view.dart';
import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class SingupView extends StatefulWidget {
  const SingupView({super.key});

  @override
  State<SingupView> createState() => _SingupViewState();
}

class _SingupViewState extends State<SingupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwrdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordretleController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwrdController.dispose();
    emailController.dispose();
    passwordretleController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InputBmiView()),
      );
    }
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    if (value.trim() != passwrdController.text.trim()) {
      return 'Passwords do not match';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.color3,
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
                    color: AppColor.color1,
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
                            Icons.person_add,
                            color: AppColor.color3,
                            size: 34,
                          ),
                        ),
                      ),
                      const Gap(22),
                      CustomText(
                        text: "Sign up",
                        color: AppColor.color2,
                        size: 26,
                        fontWeight: FontWeight.w700,
                      ),
                      const Gap(8),
                      CustomText(
                        text: "Create your account information",
                        color: AppColor.color2,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(26),
                      CustomTxtfield(
                        hint: "name",
                        isPassword: false,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        prefixIcon: Icons.person,
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(18),
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
                        controller: passwrdController,
                        prefixIcon: Icons.lock,
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(18),
                      CustomTxtfield(
                        hint: "confirm password",
                        isPassword: true,
                        controller: passwordretleController,
                        prefixIcon: Icons.lock_outline,
                        textInputAction: TextInputAction.done,
                        validator: _confirmPasswordValidator,
                      ),
                      const Gap(24),
                      CustomButton(
                        text: "Sign up",
                        color: AppColor.color2,
                        width: double.infinity,
                        onTap: _signUp,
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: CustomText(
                              text: "Already have an account",
                              color: AppColor.color2,
                              size: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CustomText(
                              text: "Log In",
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
