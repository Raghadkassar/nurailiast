import 'package:flutter/material.dart';
import 'package:projecttt/core/const/app_color.dart';


class cont_wheigt extends StatelessWidget {
  const cont_wheigt({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 1.65;
    double weightBefore = 85.0;
    double weightNow = 78.0;
    double weightTarget = 70.0;

    double bmiBefore = weightBefore / (height * height);
    double bmiNow = weightNow / (height * height);
    
    // حساب نسبة التقدم للهدف
    double progress = (weightBefore - weightNow) / (weightBefore - weightTarget);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD), // خلفية هادئة جداً
      appBar: AppBar(
        title: const Text("رحلة الرشاقة", 
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.2)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.color2, AppColor.color1],
            ),
          ),
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. كرت الـ BMI الاحترافي مع خلفية متدرجة خفيفة
              _buildProfessionalBMICard(bmiBefore, bmiNow),
              
              const SizedBox(height: 30),
              
              // 2. إحصائيات الوزن بشكل كروت منفصلة أنيقة
              _buildModernWeightStats(weightBefore, weightNow, weightTarget),

              const SizedBox(height: 30),
              
              // 3. شريط التقدم للهدف
              _buildGoalProgress(progress),

              const SizedBox(height: 30),
              
              // 4. السجل بتصميم Timeline عصري
              _buildSectionTitle("سجل الانتصارات", Icons.auto_awesome_outlined),
              const SizedBox(height: 15),
              _buildHistoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfessionalBMICard(double before, double after) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColor.color2.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.color1.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.speed_rounded, color: AppColor.color2, size: 24),
              ),
              const SizedBox(width: 12),
              const Text("تحليل مؤشر الكتلة", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bmiDetail("سابقاً", before.toStringAsFixed(1), AppColor.color3, false),
              Container(
                height: 40,
                width: 1,
                color: AppColor.color3.withOpacity(0.5),
              ),
              _bmiDetail("حالياً", after.toStringAsFixed(1), AppColor.color2, true),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColor.color2.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              _getBMIMessage(after),
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.color2, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bmiDetail(String label, String val, Color color, bool isPrimary) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(val, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: color)),
      ],
    );
  }

  Widget _buildModernWeightStats(double start, double current, double target) {
    return Row(
      children: [
        _statCard("البداية", "$start", AppColor.color3, Icons.flag_outlined),
        const SizedBox(width: 15),
        _statCard("الحالي", "$current", AppColor.color2, Icons.monitor_weight_outlined),
        const SizedBox(width: 15),
        _statCard("الهدف", "$target", AppColor.color4, Icons.stars_outlined),
      ],
    );
  }

  Widget _statCard(String label, String val, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.color3.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(val, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalProgress(double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("التقدم نحو الهدف", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        const SizedBox(height: 12),
        Stack(
          children: [
            Container(
              height: 12,
              decoration: BoxDecoration(
                color: AppColor.color3.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 12,
              width: 300 * progress, // مجرد مثال للطول
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColor.color1, AppColor.color2]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: AppColor.color2.withOpacity(0.3), blurRadius: 10)],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHistoryList() {
    return Column(
      children: List.generate(3, (index) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColor.color4.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(Icons.check_rounded, color: AppColor.color4, size: 20),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("خسارة 0.5 كجم", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                Text("12 مايو 2026", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Text("78.0", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: AppColor.color2)),
          ],
        ),
      )),
    );
  }

  Widget _buildSectionTitle(String t, IconData i) {
    return Row(
      children: [
        Icon(i, color: AppColor.color2, size: 22),
        const SizedBox(width: 10),
        Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
      ],
    );
  }

  String _getBMIMessage(double bmi) {
    if (bmi < 18.5) return "تحتاجي تغذية سليمة 🍎";
    if (bmi < 25) return "أنتِ في الوزن المثالي، مذهلة! ✨";
    if (bmi < 30) return "خطوات بسيطة وتصلي للمثالي 💪";
    return "رحلة الألف ميل تبدأ بخطوة ⚡";
  }
}