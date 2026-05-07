import 'package:flutter/material.dart';

// ignore: camel_case_types
class cont_wheigt extends StatelessWidget {
  const cont_wheigt({
    super.key,
    required this.height,
    required this.currentWeight,
    required this.targetWeight,
  });

  final double? height;
  final double? currentWeight;
  final double? targetWeight;

  static const Color _backgroundTop = Color(0xFFFFEEF5);
  static const Color _backgroundBottom = Color(0xFFFFFAF3);
  static const Color _textColor = Color(0xFF3A2634);
  static const Color _mutedTextColor = Color(0xFF8B6F80);
  static const Color _roseColor = Color(0xFFC86B8F);
  static const Color _purpleColor = Color(0xFF8B5E83);
  static const Color _greenColor = Color(0xFF7DBE9F);

  @override
  Widget build(BuildContext context) {
    final double weightBefore = currentWeight ?? 0;
    final double weightNow = currentWeight ?? 0;
    final double weightTarget = targetWeight ?? weightNow;

    final double bmiBefore = _calculateBmi(weightBefore);
    final double bmiNow = _calculateBmi(weightNow);
    final double lostWeight = _calculateMovedWeight(
      weightBefore,
      weightNow,
      weightTarget,
    );
    final double totalGoal = (weightBefore - weightTarget).abs();
    final double remainingWeight = (weightNow - weightTarget).abs();
    final double progress = _calculateProgress(
      lostWeight: lostWeight,
      totalGoal: totalGoal,
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_backgroundTop, _backgroundBottom],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 18),
                      _buildSummaryCard(lostWeight, totalGoal, progress),
                      const SizedBox(height: 18),
                      _buildProfessionalBMICard(bmiBefore, bmiNow),
                      const SizedBox(height: 18),
                      _buildModernWeightStats(
                        weightBefore,
                        weightNow,
                        weightTarget,
                      ),
                      const SizedBox(height: 18),
                      _buildGoalProgress(progress, remainingWeight),
                      const SizedBox(height: 22),
                      _buildSectionTitle(
                        'سجل التقدم',
                        Icons.auto_awesome_outlined,
                      ),
                      const SizedBox(height: 14),
                      _buildHistoryTimeline(weightNow),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.74),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.78)),
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _roseColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: _roseColor,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'رحلة الرشاقة',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'تابعي تقدمك بخطوات هادئة وواضحة',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _mutedTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
      double lostWeight, double totalGoal, double progress) {
    final int percent = (progress * 100).round();

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
            color: _roseColor.withValues(alpha: 0.22),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'خسرتِ ${lostWeight.toStringAsFixed(1)} كجم من أصل ${totalGoal.toStringAsFixed(1)} كجم',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    value: progress,
                    backgroundColor: Colors.white.withValues(alpha: 0.22),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$percent%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalBMICard(double before, double after) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(_roseColor),
      child: Column(
        children: [
          Row(
            children: [
              _softIcon(Icons.speed_rounded, _roseColor),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'تحليل مؤشر الكتلة',
                  style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: _bmiDetail(
                  'سابقاً',
                  before.toStringAsFixed(1),
                  _mutedTextColor,
                ),
              ),
              Container(
                height: 44,
                width: 1,
                color: _roseColor.withValues(alpha: 0.18),
              ),
              Expanded(
                child: _bmiDetail(
                  'حالياً',
                  after.toStringAsFixed(1),
                  _roseColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
            decoration: BoxDecoration(
              color: _roseColor.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              _getBMIMessage(after),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: _roseColor,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bmiDetail(String label, String val, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: _mutedTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            val,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModernWeightStats(double start, double current, double target) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _statCard(
          'البداية',
          start.toStringAsFixed(1),
          _purpleColor,
          Icons.flag_outlined,
        ),
        _statCard(
          'الحالي',
          current.toStringAsFixed(1),
          _roseColor,
          Icons.monitor_weight_outlined,
        ),
        _statCard(
          'الهدف',
          target.toStringAsFixed(1),
          _greenColor,
          Icons.stars_outlined,
        ),
      ],
    );
  }

  Widget _statCard(String label, String val, Color color, IconData icon) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = (constraints.maxWidth - 20) / 3;

        return SizedBox(
          width: width < 92 ? constraints.maxWidth : width,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.14)),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(icon, color: color, size: 22),
                const SizedBox(height: 8),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    val,
                    style: const TextStyle(
                      color: _textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: _mutedTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGoalProgress(double progress, double remainingWeight) {
    final int percent = (progress * 100).round();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(_purpleColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'التقدم نحو الهدف',
                  style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                '$percent%',
                style: const TextStyle(
                  color: _roseColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'باقي ${remainingWeight.toStringAsFixed(1)} كجم للوصول للهدف',
            style: const TextStyle(
              color: _mutedTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: _roseColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    height: 12,
                    width: constraints.maxWidth * progress,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE9A0BC), Color(0xFFC86B8F)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: _roseColor.withValues(alpha: 0.22),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTimeline(double currentWeight) {
    final items = [
      _HistoryItem(
        'الوزن الحالي',
        'من بيانات الإدخال',
        currentWeight.toStringAsFixed(1),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(_greenColor),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isLast = index == items.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: _greenColor.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: _greenColor,
                      size: 18,
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 38,
                      color: _greenColor.withValues(alpha: 0.18),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: _textColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.date,
                              style: const TextStyle(
                                fontSize: 12,
                                color: _mutedTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item.weight,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                          color: _roseColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSectionTitle(String t, IconData i) {
    return Row(
      children: [
        Icon(i, color: _roseColor, size: 22),
        const SizedBox(width: 10),
        Text(
          t,
          style: const TextStyle(
            color: _textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _softIcon(IconData icon, Color color) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  BoxDecoration _cardDecoration(Color color) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: 0.88),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: color.withValues(alpha: 0.10),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  double _calculateBmi(double weight) {
    final inputHeight = height;
    if (inputHeight == null || inputHeight <= 0) {
      return 0;
    }

    return weight / (inputHeight * inputHeight);
  }

  double _calculateMovedWeight(
    double start,
    double current,
    double target,
  ) {
    final total = (start - target).abs();
    final remaining = (current - target).abs();

    return (total - remaining).clamp(0.0, total).toDouble();
  }

  double _calculateProgress({
    required double lostWeight,
    required double totalGoal,
  }) {
    if (totalGoal == 0) {
      return 1;
    }

    return (lostWeight / totalGoal).clamp(0.0, 1.0).toDouble();
  }

  String _getBMIMessage(double bmi) {
    if (bmi < 18.5) return 'تحتاجي تغذية سليمة';
    if (bmi < 25) return 'أنتِ في الوزن المثالي، مذهلة';
    if (bmi < 30) return 'خطوات بسيطة وتصلي للمثالي';
    return 'رحلة الألف ميل تبدأ بخطوة';
  }
}

class _HistoryItem {
  const _HistoryItem(this.title, this.date, this.weight);

  final String title;
  final String date;
  final String weight;
}
