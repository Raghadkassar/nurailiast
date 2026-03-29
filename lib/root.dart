import 'package:flutter/material.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/cart/view/cart_view.dart';
import 'package:projecttt/fetcher/check/view/check_view.dart';
import 'package:projecttt/fetcher/home/view/home_view.dart';
import 'package:projecttt/fetcher/oreder/view/order_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController pageController;

  late List<Widget> _screens;
  int currentIndex = 0;

  @override
  void initState() {
    _screens = [HomeView(), CartView(), OrderView(), CheckView()];
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
          color: AppColor.color2,
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: 'MN ',
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
