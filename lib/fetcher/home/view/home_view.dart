import 'package:flutter/material.dart';
import 'package:projecttt/fetcher/bmi_page/consul%20nutrition/cons.dart';
import 'package:projecttt/fetcher/bmi_page/continue%20whegit/cont.dart';
import 'package:projecttt/fetcher/bmi_page/recipes_healthy/rec.dart';
import 'package:projecttt/fetcher/bmi_page/view/bmi_mod.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.bmiResult, this.bmiDiagnosis});

  final double? bmiResult;
  final String? bmiDiagnosis;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const Color _darkTextColor = Color(0xFF3A2634);
  static const Color _mutedTextColor = Color(0xFF8B6F80);
  static const Color _primaryColor = Color(0xFFC86B8F);

  int? _pressedServiceIndex;

  bool get _hasBmiResult => widget.bmiResult != null;

  String get _bmiValue {
    if (!_hasBmiResult) {
      return '--';
    }

    return widget.bmiResult!.toStringAsFixed(2);
  }

  String get _diagnosisText {
    if (!_hasBmiResult) {
      return 'احسبي BMI لعرض التشخيص';
    }

    return widget.bmiDiagnosis ?? 'غير محدد';
  }

  Color get _diagnosisColor {
    switch (widget.bmiDiagnosis) {
      case 'نحافة':
        return const Color(0xFF7BA7D7);
      case 'طبيعي':
        return const Color(0xFF7DBE9F);
      case 'سمنة':
        return const Color(0xFFE5A35C);
      case 'بدانة':
        return const Color(0xFFD9789D);
      default:
        return Colors.white;
    }
  }

  double get _bmiProgress {
    if (!_hasBmiResult) {
      return 0;
    }

    final value = widget.bmiResult!.clamp(12, 40);
    return ((value - 12) / 28).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFEEF5), Color(0xFFFFF8F0), Color(0xFFF7EFFB)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(18, 20, 18, 28),
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildBmiResultCard(),
                    const SizedBox(height: 24),
                    _buildSectionHeader(),
                    const SizedBox(height: 12),
                    _buildServiceCard(
                      index: 0,
                      title: 'تخطيط النظام الغذائي',
                      subtitle: 'تصميم خطة شخصية لتحقيق أهدافك',
                      icon: Icons.local_dining_outlined,
                      colors: const [Color(0xFFFFD8C7), Color(0xFFF2A7A0)],
                      accentColor: const Color(0xFF9A4E58),
                      page: BmiMod(),
                    ),
                    _buildServiceCard(
                      index: 1,
                      title: 'متابعة الوزن والصحة',
                      subtitle: 'متابعة مستمرة لضمان تقدمك الصحي',
                      icon: Icons.monitor_weight_outlined,
                      colors: const [Color(0xFFE7D7F5), Color(0xFFC9A8E8)],
                      accentColor: const Color(0xFF73559A),
                      page: cont_wheigt(),
                    ),
                    _buildServiceCard(
                      index: 2,
                      title: 'استشارات التغذية',
                      subtitle: 'جلسات استشارية لتعلم التغذية الصحيحة',
                      icon: Icons.spa_outlined,
                      colors: const [Color(0xFFD8EFE4), Color(0xFF9CCFB7)],
                      accentColor: const Color(0xFF3D7A60),
                      page: cons_wheigt(),
                    ),
                    _buildServiceCard(
                      index: 3,
                      title: 'وصفات صحية',
                      subtitle: 'اقتراح وصفات متوازنة وسهلة التحضير',
                      icon: Icons.menu_book_outlined,
                      colors: const [Color(0xFFF8D5E4), Color(0xFFE89ABC)],
                      accentColor: const Color(0xFF9B4A70),
                      page: rec_healthy(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.82)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFE9A0BC), Color(0xFFC86B8F)],
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: _primaryColor.withValues(alpha: 0.18),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الرئيسية',
                  style: TextStyle(
                    color: _darkTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'أهلاً بك، تابعي نتيجة BMI وخدماتك الصحية',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _mutedTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBmiResultCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFD9789D), Color(0xFF8B5E83)],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: _primaryColor.withValues(alpha: 0.26),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _hasBmiResult
                              ? Icons.verified_outlined
                              : Icons.auto_awesome_outlined,
                          color: Colors.white.withValues(alpha: 0.86),
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _hasBmiResult
                              ? 'نتيجة BMI'
                              : 'هون ح يكون نتيجة ال bmi',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.78),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _diagnosisText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.92),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    _bmiValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  _hasBmiResult ? 'kg/m²' : 'بانتظار الحساب',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.74),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _hasBmiResult
                  ? _diagnosisColor.withValues(alpha: 0.28)
                  : Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: _hasBmiResult
                    ? _diagnosisColor.withValues(alpha: 0.55)
                    : Colors.white.withValues(alpha: 0.12),
              ),
            ),
            child: Text(
              _hasBmiResult
                  ? 'التشخيص: $_diagnosisText'
                  : 'احسبي BMI لعرض التشخيص',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildBmiScale(),
        ],
      ),
    );
  }

  Widget _buildBmiScale() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 9,
            child: Stack(
              children: [
                Row(
                  children: const [
                    Expanded(child: ColoredBox(color: Color(0xFF7BA7D7))),
                    Expanded(child: ColoredBox(color: Color(0xFF7DBE9F))),
                    Expanded(child: ColoredBox(color: Color(0xFFE5A35C))),
                    Expanded(child: ColoredBox(color: Color(0xFFD9789D))),
                  ],
                ),
                if (_hasBmiResult)
                  Align(
                    alignment: Alignment((_bmiProgress * 2) - 1, 0),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: _diagnosisColor, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildScaleLabel('نحافة'),
            _buildScaleLabel('طبيعي'),
            _buildScaleLabel('سمنة'),
            _buildScaleLabel('بدانة'),
          ],
        ),
      ],
    );
  }

  Widget _buildScaleLabel(String text) {
    final isActive = _hasBmiResult && widget.bmiDiagnosis == text;

    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.56),
          fontSize: 11,
          fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'الخدمات الصحية',
            style: TextStyle(
              color: _darkTextColor,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.72),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Text(
            '٤ خدمات',
            style: TextStyle(
              color: _mutedTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> colors,
    required Color accentColor,
    required Widget page,
  }) {
    final isPressed = _pressedServiceIndex == index;

    return AnimatedScale(
      scale: isPressed ? 0.98 : 1,
      duration: const Duration(milliseconds: 140),
      curve: Curves.easeOut,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: accentColor.withValues(alpha: 0.13),
              blurRadius: 18,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            splashColor: Colors.white.withValues(alpha: 0.18),
            highlightColor: Colors.white.withValues(alpha: 0.08),
            onTapDown: (_) {
              setState(() => _pressedServiceIndex = index);
            },
            onTapCancel: () {
              setState(() => _pressedServiceIndex = null);
            },
            onTap: () {
              setState(() => _pressedServiceIndex = null);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.38),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.30),
                      ),
                    ),
                    child: Icon(icon, color: accentColor, size: 26),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _darkTextColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: _darkTextColor.withValues(alpha: 0.68),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.5,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.30),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: accentColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
