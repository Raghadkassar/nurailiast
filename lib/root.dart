import 'package:flutter/material.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/bmi_page/view/bmi_fit.dart';

import 'package:projecttt/fetcher/home/view/home_view.dart';
import 'package:projecttt/fetcher/oreder/view/order_view.dart';

class Root extends StatefulWidget {
  const Root({
    super.key,
    this.bmiResult,
    this.bmiDiagnosis,
    this.height,
    this.currentWeight,
    this.targetWeight,
  });

  final double? bmiResult;
  final String? bmiDiagnosis;
  final double? height;
  final double? currentWeight;
  final double? targetWeight;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> _screens;
  late List<GlobalKey<NavigatorState>> _navigatorKeys;
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _screens = [
      BmiFit(),
      HomeView(
        bmiResult: widget.bmiResult,
        bmiDiagnosis: widget.bmiDiagnosis,
        height: widget.height,
        currentWeight: widget.currentWeight,
        targetWeight: widget.targetWeight,
      ),
      OrderView(),
      BmiFit(),
    ];
    _navigatorKeys = List.generate(
      _screens.length,
      (_) => GlobalKey<NavigatorState>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: List.generate(_screens.length, _buildTabNavigator),
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
            if (index == currentIndex) {
              _navigatorKeys[index].currentState?.popUntil(
                    (route) => route.isFirst,
                  );
              return;
            }

            setState(() {
              currentIndex = index;
            });
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

  Widget _buildTabNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (_) {
        return MaterialPageRoute(
          builder: (context) => _screens[index],
        );
      },
    );
  }
}
