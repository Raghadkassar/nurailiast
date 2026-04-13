import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});

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
              children: [
                Gap(100),
                //  Image.asset(assets/imges/food.jpg),
                Gap(18),
                Text(
                  'food app',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'welcom Back',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(70),
                TextFormField(
                  cursorColor: Colors.black,
                  validator: (v) {
                    if (v == null) {
                      return 'please filt';
                    }
                  },
                  // obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'first name',

                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                Gap(40),

                TextFormField(
                  cursorColor: Colors.black,
                  validator: (v) {
                    if (v == null) {
                      return 'please filt';
                    }
                  },
                  // obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'second name',

                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                Gap(40),

                TextFormField(
                  cursorColor: Colors.black,
                  validator: (v) {
                    if (v == null) {
                      return 'please filt';
                    }
                  },

                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'email addres',

                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                Gap(40),
                TextFormField(
                  cursorColor: Colors.black,
                  validator: (v) {
                    if (v == null) {
                      return 'please filt';
                    }
                  },
                  // obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'put passowrd',

                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                Gap(40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {},
                  child: Text("Login", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
