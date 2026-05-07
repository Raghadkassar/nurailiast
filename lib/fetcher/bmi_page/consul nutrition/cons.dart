import 'package:flutter/material.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

// ignore: camel_case_types
class cons_wheigt extends StatefulWidget {
  const cons_wheigt({
    super.key,
    this.bmiResult,
    this.bmiDiagnosis,
    this.currentWeight,
    this.targetWeight,
  });

  final double? bmiResult;
  final String? bmiDiagnosis;
  final double? currentWeight;
  final double? targetWeight;

  @override
  State<cons_wheigt> createState() => _cons_wheigtState();
}

// ignore: camel_case_types
class _cons_wheigtState extends State<cons_wheigt> {
  static const Color _backgroundTop = Color(0xFFFFEEF5);
  static const Color _backgroundMiddle = Color(0xFFFFF8F0);
  static const Color _backgroundBottom = Color(0xFFF1F8F4);
  static const Color _textColor = Color(0xFF3A2634);
  static const Color _mutedTextColor = Color(0xFF8B6F80);
  static const Color _roseColor = Color(0xFFC86B8F);
  static const Color _purpleColor = Color(0xFF8B5E83);
  static const Color _greenColor = Color(0xFF7DBE9F);
  static const Color _goldColor = Color(0xFFE5A35C);

  String _goal = 'خسارة وزن';
  String _meals = '3 وجبات';
  String _activity = 'متوسط';
  String _sleep = '6-8 ساعات';
  String _sessionType = 'أونلاين';
  String? _selectedTime;
  int? _selectedSpecialistIndex;
  bool _bookingConfirmed = false;
  final Set<String> _notes = {};
  final _extraNotesController = TextEditingController();
  final List<_BookedConsultation> _bookings = [];

  List<_Nutritionist> get _nutritionists => const [
        _Nutritionist(
          name: 'د. سارة محمود',
          specialty: 'إدارة الوزن والوجبات اليومية',
          rating: '4.9',
          price: '35\$',
          duration: '45 دقيقة',
          icon: Icons.spa_outlined,
          color: _greenColor,
          slots: ['اليوم 7:00 م', 'غداً 5:30 م', 'السبت 11:00 ص'],
        ),
        _Nutritionist(
          name: 'أ. لينا خالد',
          specialty: 'تغذية علاجية وأمراض مزمنة',
          rating: '4.8',
          price: '40\$',
          duration: '50 دقيقة',
          icon: Icons.health_and_safety_outlined,
          color: _roseColor,
          slots: ['اليوم 9:00 م', 'غداً 1:00 م', 'الأحد 6:00 م'],
        ),
        _Nutritionist(
          name: 'د. ريم عادل',
          specialty: 'تغذية رياضية وبناء عادات',
          rating: '4.7',
          price: '30\$',
          duration: '40 دقيقة',
          icon: Icons.fitness_center_outlined,
          color: _purpleColor,
          slots: ['غداً 8:00 م', 'السبت 2:00 م', 'الإثنين 10:00 ص'],
        ),
      ];

  @override
  void dispose() {
    _extraNotesController.dispose();
    super.dispose();
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
              colors: [_backgroundTop, _backgroundMiddle, _backgroundBottom],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 26),
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 18),
                    _buildUserSummary(),
                    const SizedBox(height: 18),
                    _buildQuestionsCard(),
                    const SizedBox(height: 18),
                    _buildSmartSuggestion(),
                    const SizedBox(height: 18),
                    _buildSpecialistsSection(),
                    if (_bookings.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      _buildSavedBookings(),
                    ],
                    const SizedBox(height: 18),
                    _buildNotesSection(),
                    const SizedBox(height: 18),
                    _buildWeeklyMessages(),
                  ],
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
      decoration: _softCardDecoration(_roseColor),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _greenColor.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: _greenColor,
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
                  'استشارات التغذية',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'جهزي بياناتك واحجزي جلسة مناسبة لهدفك',
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

  Widget _buildUserSummary() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFD9789D), Color(0xFF8B5E83)],
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: _roseColor.withValues(alpha: 0.20),
            blurRadius: 22,
            offset: const Offset(0, 10),
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
                  Icons.person_search_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ملخص المستخدم',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _summarySubtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.78),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _summaryMiniCard(
                'الحالي',
                _formatWeight(widget.currentWeight),
                Icons.monitor_weight_outlined,
              ),
              const SizedBox(width: 10),
              _summaryMiniCard(
                'الهدف',
                _formatWeight(widget.targetWeight),
                Icons.flag_outlined,
              ),
              const SizedBox(width: 10),
              _summaryMiniCard(
                'BMI',
                _formatBmi(widget.bmiResult),
                Icons.speed_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryMiniCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 21),
            const SizedBox(height: 7),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.74),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _softCardDecoration(_purpleColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('أسئلة ما قبل الاستشارة', Icons.fact_check_outlined),
          const SizedBox(height: 16),
          _choiceGroup(
            title: 'الهدف الأساسي',
            options: const ['خسارة وزن', 'زيادة وزن', 'تثبيت وزن', 'نظام صحي'],
            selected: _goal,
            onSelected: (value) => setState(() => _goal = value),
          ),
          const SizedBox(height: 14),
          _choiceGroup(
            title: 'عدد الوجبات اليومي',
            options: const ['وجبتين', '3 وجبات', '4 وجبات', 'غير منتظم'],
            selected: _meals,
            onSelected: (value) => setState(() => _meals = value),
          ),
          const SizedBox(height: 14),
          _choiceGroup(
            title: 'النشاط اليومي',
            options: const ['قليل', 'متوسط', 'عالي'],
            selected: _activity,
            onSelected: (value) => setState(() => _activity = value),
          ),
          const SizedBox(height: 14),
          _choiceGroup(
            title: 'النوم',
            options: const ['أقل من 6 ساعات', '6-8 ساعات', 'أكثر من 8 ساعات'],
            selected: _sleep,
            onSelected: (value) => setState(() => _sleep = value),
          ),
        ],
      ),
    );
  }

  Widget _choiceGroup({
    required String title,
    required List<String> options,
    required String selected,
    required ValueChanged<String> onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: _textColor,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = option == selected;

            return ChoiceChip(
              label: Text(option),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: _roseColor.withValues(alpha: 0.18),
              backgroundColor: Colors.white,
              side: BorderSide(
                color: isSelected
                    ? _roseColor
                    : _mutedTextColor.withValues(alpha: 0.14),
              ),
              labelStyle: TextStyle(
                color: isSelected ? _roseColor : _textColor,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
              onSelected: (_) => onSelected(option),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSmartSuggestion() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _softCardDecoration(_greenColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _softIcon(Icons.auto_awesome_outlined, _greenColor),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'الاقتراح الأولي الذكي',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            _smartSuggestion,
            style: const TextStyle(
              color: _mutedTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _suggestionTags
                .map(
                  (tag) => _tinyTag(tag, _greenColor),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialistsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionTitle('أخصائيين التغذية', Icons.groups_2_outlined),
        const SizedBox(height: 12),
        ...List.generate(_nutritionists.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == _nutritionists.length - 1 ? 0 : 12,
            ),
            child: _specialistCard(index, _nutritionists[index]),
          );
        }),
      ],
    );
  }

  Widget _specialistCard(int index, _Nutritionist nutritionist) {
    final isSelected = _selectedSpecialistIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected
              ? nutritionist.color.withValues(alpha: 0.38)
              : Colors.white.withValues(alpha: 0.80),
        ),
        boxShadow: [
          BoxShadow(
            color:
                nutritionist.color.withValues(alpha: isSelected ? 0.16 : 0.08),
            blurRadius: isSelected ? 20 : 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _softIcon(nutritionist.icon, nutritionist.color),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nutritionist.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      nutritionist.specialty,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _mutedTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _infoPill(Icons.star_rounded, nutritionist.rating, _goldColor),
              const SizedBox(width: 8),
              _infoPill(
                  Icons.schedule_outlined, nutritionist.duration, _greenColor),
              const SizedBox(width: 8),
              _infoPill(
                  Icons.payments_outlined, nutritionist.price, _roseColor),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _selectSpecialist(index),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: isSelected ? nutritionist.color : _textColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                isSelected ? 'تعديل الموعد' : 'احجزي موعد',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          if (isSelected) ...[
            const SizedBox(height: 14),
            _bookingPanel(nutritionist),
          ],
        ],
      ),
    );
  }

  Widget _bookingPanel(_Nutritionist nutritionist) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: nutritionist.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'نوع الجلسة',
            style: TextStyle(
              color: _textColor,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['أونلاين', 'حضوري'].map((type) {
              final isSelected = _sessionType == type;

              return ChoiceChip(
                label: Text(type),
                selected: isSelected,
                showCheckmark: false,
                backgroundColor: Colors.white,
                selectedColor: nutritionist.color.withValues(alpha: 0.18),
                side: BorderSide(
                  color: isSelected
                      ? nutritionist.color
                      : _mutedTextColor.withValues(alpha: 0.14),
                ),
                labelStyle: TextStyle(
                  color: isSelected ? nutritionist.color : _textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                onSelected: (_) {
                  setState(() {
                    _sessionType = type;
                    _bookingConfirmed = false;
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          const Text(
            'الأوقات المتاحة',
            style: TextStyle(
              color: _textColor,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: nutritionist.slots.map((slot) {
              final isSelected = _selectedTime == slot;

              return ChoiceChip(
                label: Text(slot),
                selected: isSelected,
                showCheckmark: false,
                backgroundColor: Colors.white,
                selectedColor: nutritionist.color.withValues(alpha: 0.18),
                side: BorderSide(
                  color: isSelected
                      ? nutritionist.color
                      : _mutedTextColor.withValues(alpha: 0.14),
                ),
                labelStyle: TextStyle(
                  color: isSelected ? nutritionist.color : _textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                onSelected: (_) {
                  setState(() {
                    _selectedTime = slot;
                    _bookingConfirmed = false;
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _confirmBooking,
              icon: const Icon(Icons.check_circle_outline, size: 18),
              label: const Text('تأكيد الحجز'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: nutritionist.color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          if (_bookingConfirmed) ...[
            const SizedBox(height: 10),
            Text(
              'تم تجهيز حجز $_sessionType مع ${nutritionist.name} في $_selectedTime',
              style: TextStyle(
                color: nutritionist.color,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                height: 1.35,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSavedBookings() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _softCardDecoration(_greenColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('حجوزاتي', Icons.event_available_outlined),
          const SizedBox(height: 12),
          ...List.generate(_bookings.length, (index) {
            final booking = _bookings[index];

            return Container(
              margin: EdgeInsets.only(
                bottom: index == _bookings.length - 1 ? 0 : 10,
              ),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.74),
                borderRadius: BorderRadius.circular(18),
                border:
                    Border.all(color: booking.color.withValues(alpha: 0.14)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: booking.color.withValues(alpha: 0.13),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: booking.color,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.specialistName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${booking.sessionType} - ${booking.time}',
                          style: const TextStyle(
                            color: _mutedTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        if (booking.notes.isNotEmpty) ...[
                          const SizedBox(height: 5),
                          Text(
                            booking.notes,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: _mutedTextColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    const noteOptions = [
      'لا يوجد',
      'سكري',
      'ضغط',
      'غدة',
      'حساسية لاكتوز',
      'حساسية غلوتين',
      'حمل',
    ];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _softCardDecoration(_goldColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
              'ملاحظات صحية مهمة', Icons.medical_information_outlined),
          const SizedBox(height: 12),
          const Text(
            'اختاري أي ملاحظة لازم يعرفها الأخصائي قبل الجلسة.',
            style: TextStyle(
              color: _mutedTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: noteOptions.map((note) {
              final isSelected = _notes.contains(note);

              return FilterChip(
                label: Text(note),
                selected: isSelected,
                showCheckmark: false,
                backgroundColor: Colors.white,
                selectedColor: _goldColor.withValues(alpha: 0.18),
                side: BorderSide(
                  color: isSelected
                      ? _goldColor
                      : _mutedTextColor.withValues(alpha: 0.14),
                ),
                labelStyle: TextStyle(
                  color: isSelected ? _goldColor : _textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                onSelected: (_) => _toggleNote(note),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          CustomTxtfield(
            hint: 'ملاحظات إضافية',
            isPassword: false,
            controller: _extraNotesController,
            keyboardType: TextInputType.text,
            prefixIcon: Icons.edit_note_outlined,
            textInputAction: TextInputAction.done,
            validator: (_) => null,
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyMessages() {
    final messages = _weeklyMessages;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _softCardDecoration(_greenColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
              'رسائل المتابعة الأسبوعية', Icons.mark_email_unread_outlined),
          const SizedBox(height: 14),
          ...List.generate(messages.length, (index) {
            final item = messages[index];

            return Container(
              margin: EdgeInsets.only(
                  bottom: index == messages.length - 1 ? 0 : 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.74),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _greenColor.withValues(alpha: 0.12)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: _greenColor.withValues(alpha: 0.13),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: _greenColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: _textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: _roseColor, size: 22),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _textColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
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

  Widget _infoPill(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 15),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tinyTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  BoxDecoration _softCardDecoration(Color color) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: 0.88),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withValues(alpha: 0.75)),
      boxShadow: [
        BoxShadow(
          color: color.withValues(alpha: 0.09),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  void _selectSpecialist(int index) {
    final specialist = _nutritionists[index];

    setState(() {
      _selectedSpecialistIndex = index;
      _selectedTime = specialist.slots.first;
      _bookingConfirmed = false;
    });
  }

  void _confirmBooking() {
    final selectedIndex = _selectedSpecialistIndex;
    final selectedTime = _selectedTime;

    if (selectedIndex == null || selectedTime == null) {
      return;
    }

    final nutritionist = _nutritionists[selectedIndex];
    final healthNotes = _notes.isEmpty ? '' : _notes.join('، ');
    final extraNotes = _extraNotesController.text.trim();
    final notes = [
      if (healthNotes.isNotEmpty) healthNotes,
      if (extraNotes.isNotEmpty) extraNotes,
    ].join(' - ');

    setState(() {
      _bookingConfirmed = true;
      _bookings.insert(
        0,
        _BookedConsultation(
          specialistName: nutritionist.name,
          sessionType: _sessionType,
          time: selectedTime,
          notes: notes,
          color: nutritionist.color,
        ),
      );
    });
  }

  void _toggleNote(String note) {
    setState(() {
      if (note == 'لا يوجد') {
        _notes
          ..clear()
          ..add(note);
        return;
      }

      _notes.remove('لا يوجد');
      if (_notes.contains(note)) {
        _notes.remove(note);
      } else {
        _notes.add(note);
      }
    });
  }

  String get _summarySubtitle {
    final diagnosis = widget.bmiDiagnosis;
    if (diagnosis == null || diagnosis.trim().isEmpty) {
      return 'البيانات جاهزة لتجهيز استشارة مناسبة.';
    }

    return 'التشخيص الحالي: $diagnosis';
  }

  String get _smartSuggestion {
    final bmi = widget.bmiResult;

    if (_notes.contains('سكري')) {
      return 'ابدئي بخطة وجبات ثابتة التوقيت، وركزي على كربوهيدرات معقدة وبروتين بكل وجبة. اختاري أخصائي تغذية علاجية حتى تكون الخطة مناسبة للسكري.';
    }

    if (_notes.contains('ضغط')) {
      return 'الأفضل تقليل الموالح والأطعمة المصنعة، وزيادة الخضار والماء خلال اليوم. جلسة التغذية العلاجية بتساعدك تضبطي الخطة بدون حرمان.';
    }

    if (_goal == 'زيادة وزن' || (bmi != null && bmi < 18.5)) {
      return 'ركزي على زيادة السعرات بطريقة صحية: وجبات منتظمة، بروتين كافي، وسناك غني مثل المكسرات أو اللبن. الهدف يكون زيادة تدريجية وثابتة.';
    }

    if (_goal == 'خسارة وزن' || (bmi != null && bmi >= 25)) {
      return 'ابدئي بعجز بسيط بالسعرات، زيدي البروتين والخضار، وخلي النشاط اليومي ثابت. الأهم خطة واقعية تقدري تلتزمي فيها أسبوع بعد أسبوع.';
    }

    if (_activity == 'قليل') {
      return 'حافظي على وجبات متوازنة وابدئي برفع الحركة تدريجياً. حتى 20 دقيقة مشي عدة مرات بالأسبوع بتفرق مع الالتزام الغذائي.';
    }

    return 'وضعك مناسب لخطة توازن: وجبات منتظمة، بروتين كافي، خضار يومية، ومتابعة أسبوعية بسيطة حتى يظل هدفك واضح.';
  }

  List<String> get _suggestionTags {
    final tags = <String>[_goal, _activity, _meals];

    if (_notes.isNotEmpty) {
      tags.add(_notes.contains('لا يوجد') ? 'بدون ملاحظات' : 'ملاحظات صحية');
    }

    return tags;
  }

  List<String> get _weeklyMessages {
    final firstMessage = switch (_goal) {
      'زيادة وزن' => 'هذا الأسبوع زيدي سناك صحي واحد بين الوجبات.',
      'تثبيت وزن' => 'هذا الأسبوع ثبتي مواعيد الوجبات وراقبي الجوع والشبع.',
      'نظام صحي' => 'هذا الأسبوع خليه أسبوع ترتيب: وجبة بروتين وخضار يومياً.',
      _ => 'هذا الأسبوع ركزي على طبق متوازن وخففي السكريات السائلة.',
    };

    final activityMessage = _activity == 'قليل'
        ? 'ضيفي مشي خفيف 20 دقيقة ثلاث مرات بالأسبوع.'
        : 'حافظي على نشاطك وخلي وجبة ما بعد الحركة فيها بروتين.';

    return [
      firstMessage,
      activityMessage,
      'راجعي الوزن والملاحظات نهاية الأسبوع قبل تعديل الخطة.',
    ];
  }

  String _formatWeight(double? value) {
    if (value == null) {
      return '--';
    }

    return '${value.toStringAsFixed(1)} كجم';
  }

  String _formatBmi(double? value) {
    if (value == null) {
      return '--';
    }

    return value.toStringAsFixed(1);
  }
}

class _Nutritionist {
  const _Nutritionist({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.price,
    required this.duration,
    required this.icon,
    required this.color,
    required this.slots,
  });

  final String name;
  final String specialty;
  final String rating;
  final String price;
  final String duration;
  final IconData icon;
  final Color color;
  final List<String> slots;
}

class _BookedConsultation {
  const _BookedConsultation({
    required this.specialistName,
    required this.sessionType,
    required this.time,
    required this.notes,
    required this.color,
  });

  final String specialistName;
  final String sessionType;
  final String time;
  final String notes;
  final Color color;
}
