import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/home/view/home_view.dart';
import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class InputBmiView extends StatelessWidget {
  InputBmiView({super.key});

  // 1. تعريف مفتاح الفورم للتحقق من الحقول
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController ageContrller = TextEditingController();
  final TextEditingController nameContrller = TextEditingController();
  final TextEditingController heightContrller = TextEditingController();
  final TextEditingController weightContrller = TextEditingController();
  final TextEditingController target_weightContrller = TextEditingController();
  final TextEditingController genderContrller = TextEditingController();
  final TextEditingController are_there_chronic_diseases_nowContrller =
      TextEditingController();
  final TextEditingController what_is_the_diseaseContrller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color1,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // 2. تغليف الحقول بـ Form واستخدام الـ formKey
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(60),
                Image.asset('assets/image/kkk.png', width: 180, height: 180),
                const Text(
                  "welcome to....",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Gap(40),

                CustomTxtfield(
                  hint: "Name",
                  isPassword: false,
                  controller: nameContrller,
                  keyboardType: TextInputType.name,
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "Height (e.g. 1.65)",
                  isPassword: false,
                  controller: heightContrller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "Age",
                  isPassword: false,
                  controller: ageContrller,
                  keyboardType: TextInputType.number,
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "Weight",
                  isPassword: false,
                  controller: weightContrller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "Target Weight",
                  isPassword: false,
                  controller: target_weightContrller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "Gender",
                  isPassword: false,
                  controller: genderContrller,
                  keyboardType: TextInputType.text,
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "Are there chronic diseases now?",
                  isPassword: false,
                  controller: are_there_chronic_diseases_nowContrller,
                  keyboardType: TextInputType.text,
                ),
                const Gap(20),

                CustomTxtfield(
                  hint: "What is the disease?",
                  isPassword: false,
                  controller: what_is_the_diseaseContrller,
                  keyboardType: TextInputType.text,
                ),

                const Gap(40),

                CustomButton(
                  color: AppColor.color2,
                  text: "BMI",
                  onTap: () {
                    // 3. التحقق عند الضغط على الزر
                    if (formKey.currentState!.validate()) {
                      // إذا كانت كل الحقول مليئة، ننتقل للصفحة التالية
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    } else {
                      // 4. إذا وجد حقل فارغ، نظهر الإشعار المنبثق
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("برجاء ملئ كافة الحقول المطلوبة"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                ),
                const Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
