import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projecttt/core/const/app_color.dart';
import 'package:projecttt/fetcher/home/view/home_view.dart';
import 'package:projecttt/sherd/custom_button.dart';
import 'package:projecttt/sherd/custom_text_field.dart';

class InputBmiView extends StatefulWidget {
  const InputBmiView({super.key});

  @override
  State<InputBmiView> createState() => _InputBmiViewState();
}

class _InputBmiViewState extends State<InputBmiView> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _targetWeightController = TextEditingController();
  final _diseaseController = TextEditingController();

  String? _gender;
  String? _hasChronicDiseases;

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _targetWeightController.dispose();
    _diseaseController.dispose();
    super.dispose();
  }

  bool get _showDiseaseField => _hasChronicDiseases == 'Yes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(12),
                    Image.asset('assets/image/kkk.png',
                        width: 150, height: 150),
                    const Gap(14),
                    const Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      'Enter your details to calculate your BMI plan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const Gap(28),
                    _buildFormCard(),
                    const Gap(28),
                    CustomButton(
                      color: AppColor.color2,
                      text: 'Calculate BMI',
                      height: 54,
                      radius: 14,
                      onTap: _submit,
                    ),
                    const Gap(24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
      ),
      child: Column(
        children: [
          CustomTxtfield(
            hint: 'Name',
            isPassword: false,
            controller: _nameController,
            keyboardType: TextInputType.name,
            prefixIcon: Icons.person_outline,
            textInputAction: TextInputAction.next,
            validator: _requiredText,
          ),
          const Gap(16),
          CustomTxtfield(
            hint: 'Height in meters (e.g. 1.65)',
            isPassword: false,
            controller: _heightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefixIcon: Icons.height,
            textInputAction: TextInputAction.next,
            validator: (value) => _numberValidator(
              value,
              fieldName: 'height',
              min: 0.5,
              max: 2.5,
            ),
          ),
          const Gap(16),
          CustomTxtfield(
            hint: 'Age',
            isPassword: false,
            controller: _ageController,
            keyboardType: TextInputType.number,
            prefixIcon: Icons.cake_outlined,
            textInputAction: TextInputAction.next,
            validator: (value) => _numberValidator(
              value,
              fieldName: 'age',
              min: 1,
              max: 120,
              allowDecimal: false,
            ),
          ),
          const Gap(16),
          CustomTxtfield(
            hint: 'Current weight (kg)',
            isPassword: false,
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefixIcon: Icons.monitor_weight_outlined,
            textInputAction: TextInputAction.next,
            validator: (value) => _numberValidator(
              value,
              fieldName: 'weight',
              min: 10,
              max: 400,
            ),
          ),
          const Gap(16),
          CustomTxtfield(
            hint: 'Target weight (kg)',
            isPassword: false,
            controller: _targetWeightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefixIcon: Icons.flag_outlined,
            textInputAction: TextInputAction.next,
            validator: (value) => _numberValidator(
              value,
              fieldName: 'target weight',
              min: 10,
              max: 400,
            ),
          ),
          const Gap(16),
          _buildDropdownField(
            hint: 'Gender',
            value: _gender,
            icon: Icons.wc,
            items: const ['Female', 'Male'],
            onChanged: (value) => setState(() => _gender = value),
          ),
          const Gap(16),
          _buildDropdownField(
            hint: 'Chronic diseases?',
            value: _hasChronicDiseases,
            icon: Icons.health_and_safety_outlined,
            items: const ['No', 'Yes'],
            onChanged: (value) {
              setState(() {
                _hasChronicDiseases = value;
                if (!_showDiseaseField) {
                  _diseaseController.clear();
                }
              });
            },
          ),
          if (_showDiseaseField) ...[
            const Gap(16),
            CustomTxtfield(
              hint: 'Disease name',
              isPassword: false,
              controller: _diseaseController,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.medical_information_outlined,
              textInputAction: TextInputAction.done,
              validator: _requiredText,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String hint,
    required IconData icon,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey.shade700, size: 20),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black54, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      validator: (value) => value == null ? 'Please select $hint' : null,
      onChanged: onChanged,
    );
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all required fields correctly'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final bmiResult = _calculateBmi();
    final bmiDiagnosis = _bmiDiagnosis(bmiResult);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(
          bmiResult: bmiResult,
          bmiDiagnosis: bmiDiagnosis,
        ),
      ),
    );
  }

  double _calculateBmi() {
    final height = _parseNumber(_heightController.text);
    final weight = _parseNumber(_weightController.text);

    return weight / (height * height);
  }

  String _bmiDiagnosis(double bmi) {
    if (bmi < 18.5) {
      return 'نحافة';
    }

    if (bmi < 25) {
      return 'طبيعي';
    }

    if (bmi < 30) {
      return 'سمنة';
    }

    return 'بدانة';
  }

  double _parseNumber(String value) {
    return double.parse(value.trim().replaceAll(',', '.'));
  }

  String? _requiredText(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _numberValidator(
    String? value, {
    required String fieldName,
    required double min,
    required double max,
    bool allowDecimal = true,
  }) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter your $fieldName';
    }

    if (!allowDecimal && text.contains('.')) {
      return 'Please enter a whole number';
    }

    final number = double.tryParse(text);
    if (number == null || number < min || number > max) {
      return 'Please enter a valid $fieldName';
    }

    return null;
  }
}
