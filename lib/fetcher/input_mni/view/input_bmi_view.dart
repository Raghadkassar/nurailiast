import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/root.dart';
import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class InputBmiView extends StatelessWidget {
  InputBmiView({super.key});
  TextEditingController ageContrller = TextEditingController();
  TextEditingController nameContrller = TextEditingController();
  TextEditingController heightContrller = TextEditingController();
  TextEditingController weightContrller = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController target_weightContrller = TextEditingController();
  TextEditingController genderContrller = TextEditingController();
   TextEditingController are_there_chronic_diseases_nowContrller= TextEditingController();
    TextEditingController what_is_the_diseaseContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor:AppColor.color1,

      body: Column(
        
        children: [
           Image.asset('assets/image/kkk.png',width:200,height: 200,),
           Text("welcome to....",style:TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,

           ),),
          Gap(50),
          CustomTxtfield(
            hint: "Name",
            isPassword: false,
            controller: nameContrller,
          ),
          
          Gap(25),
           CustomTxtfield(
            hint: " Height",
            isPassword: false,
            controller: heightContrller,
          ),
          Gap(25),
           CustomTxtfield(
            hint: "age",
            isPassword: false,
            controller: ageContrller,
          ),
          Gap(25),
          CustomTxtfield(
            hint: "weight",
            isPassword: false,
            controller: weightContrller,
          ),
          // Gap(25),
          //  CustomTxtfield(
          //   hint: "Target Weight",
          //   isPassword: false,
          //   controller: target_weightContrller,
          // ),
          Gap(25),
           CustomTxtfield(
            hint: "Gender",
            isPassword: false,
            controller: genderContrller,
          ),
          // Gap(25),
          //  CustomTxtfield(
          //   hint: "Are there chronic diseases now?",
          //   isPassword: false,
          //   controller: are_there_chronic_diseases_nowContrller,
          // ),
          // Gap(25),
          //  CustomTxtfield(
          //   hint: "What is the disease?",
          //   isPassword: false,
          //   controller: what_is_the_diseaseContrller,
          // ),
          Gap(25),
          CustomButton(
            color: AppColor.color2,
            text: "BMI",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Root()),
            ),
          ),
        ],
      ),
    );
    return scaffold;
  }
}
