import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.textInputAction,
    this.validator,
  });

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  State<CustomTxtfield> createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.black,
      cursorHeight: 20,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: widget.validator ?? _requiredValidator,
      inputFormatters: _inputFormatters,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, color: Colors.grey.shade700, size: 20),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _togglePassword,
                icon: Icon(
                  _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: Colors.black,
                  size: 19,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
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
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  List<TextInputFormatter> get _inputFormatters {
    final type = widget.keyboardType;
    final isDecimalNumber =
        type == const TextInputType.numberWithOptions(decimal: true);

    if (type == TextInputType.number || isDecimalNumber) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text.replaceAll(',', '.');

          if ('.'.allMatches(text).length > 1) {
            return oldValue;
          }

          return newValue.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }),
      ];
    }

    if (type == TextInputType.name || type == TextInputType.text) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\u0600-\u06FF ]')),
      ];
    }

    return const [];
  }
}
