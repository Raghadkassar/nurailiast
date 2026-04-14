import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
     this.color,
     this.fontWeight,
     this.size, 
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}


// Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         SvgPicture.asset(
                  //           "assets/logo/logo.svg",
                  //           color: AppColors.primary,
                  //           height: 35,
                  //         ),
                  //         CustomText(
                  //           text: "Hello Hungry",
                  //           fontWeight: FontWeight.w600,
                  //           size: 20,
                  //         ),
                  //       ],
                  //     ),
                  //     Spacer(),
                  //     CircleAvatar(
                  //       radius: 20,
                  //       backgroundColor: AppColors.primary,
                  //       child: Icon(Icons.person, color: Colors.white),
                  //     ),