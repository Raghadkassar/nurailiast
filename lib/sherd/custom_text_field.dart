import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ضروري جداً لعمليات الفلترة

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.keyboardType,
  });

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  State<CustomTxtfield> createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          cursorHeight: 20,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          controller: widget.controller,
          cursorColor: Colors.black,

          // 1. منع ترك الحقل فارغاً (يظهر الرسالة تحت الحقل)
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'يجب ملئ حقل ${widget.hint}';
            }
            return null;
          },

          obscureText: _obscureText,
          keyboardType: widget.keyboardType,

          // 2. الفلترة الصارمة (أرقام فقط أو أحرف فقط)
          inputFormatters: [
            if (widget.keyboardType == TextInputType.number ||
                widget.keyboardType ==
                    const TextInputType.numberWithOptions(decimal: true))
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9.]'),
              ) // يسمح فقط بالأرقام والنقطة
            else if (widget.keyboardType == TextInputType.name ||
                widget.keyboardType == TextInputType.text)
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Zء-ي ]'),
              ), // يسمح فقط بالأحرف العربية والإنجليزية والمسافات
          ],

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: _togglePassword,
                    child: Icon(
                      _obscureText
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: Colors.black,
                      size: 19,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey, width: 0.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 0.7),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
