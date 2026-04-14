import 'package:flutter/material.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/bmi_page/view/bmi_fit.dart';

import 'package:projecttt/fetcher/home/view/home_view.dart';
import 'package:projecttt/fetcher/oreder/view/order_view.dart';

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController pageController;

  late List<Widget> _screens;
  int currentIndex = 0;

  @override
  void initState() {
    _screens = [BmiFit(), HomeView(), OrderView(), BmiFit()];
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: _screens,
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.color1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,

          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rate_outlined),
              label: 'BMi',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_information),
              label: 'information',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
