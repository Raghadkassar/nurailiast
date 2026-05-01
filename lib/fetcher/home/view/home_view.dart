import 'package:flutter/material.dart';
import 'package:projecttt/fetcher/bmi_page/consul%20nutrition/cons.dart';
import 'package:projecttt/fetcher/bmi_page/continue%20whegit/cont.dart';
import 'package:projecttt/fetcher/bmi_page/recipes_healthy/rec.dart';
import 'package:projecttt/fetcher/bmi_page/view/bmi_mod.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 225, 164),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 241, 239),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(padding: EdgeInsets.all(8)),
                  // مسافة بين الأيقونة والنص
                  // العمود اللي فيه النصوص
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // عشان العمود ما ياخد مساحة الشاشة كلها طولياً
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // لبداية النص من اليمين/اليسار
                      children: [
                        Text(
                          "  هون ح يكون نتيجة ال  bmi",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 129, 5, 5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmiMod()),
              ),
              child: Container(
                //color: Colors.amberAccent,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 179, 80),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 57, 78, 73),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.restaurant, color: Colors.white),
                    ),
                    SizedBox(width: 15), // مسافة بين الأيقونة والنص
                    // العمود اللي فيه النصوص
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // عشان العمود ما ياخد مساحة الشاشة كلها طولياً
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // لبداية النص من اليمين/اليسار
                        children: [
                          Text(
                            "تخطيط النظام الغذائي",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "تصميم خطة شخصية لتحقيق أهدافك",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //شريحة تانية
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cont_wheigt()),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 133, 237, 107),

                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 57, 78, 73),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.restaurant, color: Colors.white),
                    ),
                    SizedBox(width: 15), // مسافة بين الأيقونة والنص
                    // العمود اللي فيه النصوص
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // عشان العمود ما ياخد مساحة الشاشة كلها طولياً
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // لبداية النص من اليمين/اليسار
                        children: [
                          Text(
                            "متابعة الوزن والصحة ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "متابعة مستمرة لضمان تقدمك الصحي ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //شريحة تالتة
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cons_wheigt()),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 107, 207, 237),

                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 57, 78, 73),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.restaurant, color: Colors.white),
                    ),
                    SizedBox(width: 15), // مسافة بين الأيقونة والنص
                    // العمود اللي فيه النصوص
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // عشان العمود ما ياخد مساحة الشاشة كلها طولياً
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // لبداية النص من اليمين/اليسار
                        children: [
                          Text(
                            "استشارات التغذية",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "جلسات استشارية لتعلم التغذية الصحيحة",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // شريحة رابعة
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => rec_healthy()),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 212, 90),

                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 57, 78, 73),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.restaurant, color: Colors.white),
                    ),
                    SizedBox(width: 15), // مسافة بين الأيقونة والنص
                    // العمود اللي فيه النصوص
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // عشان العمود ما ياخد مساحة الشاشة كلها طولياً
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // لبداية النص من اليمين/اليسار
                        children: [
                          Text(
                            "وصفات صحية ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            " اقتراح وصفات متوازنة وسهلة التحضير ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
