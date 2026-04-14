import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
  });
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

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
      height: 45,
      
      child: Padding(
        padding:EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: TextFormField(
          
          cursorHeight: 20,
          cursorErrorColor: Colors.black,
          style: TextStyle(fontSize: 14, color: Colors.black),
          controller: widget.controller,
          cursorColor: Colors.black,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'please fill ${widget.hint}';
            }
        
            return null;
          },
          obscureText: _obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: _togglePassword,
                    child: Icon(
                      CupertinoIcons.eye,
                      color: Colors.black,
                      size: 19,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 0.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 0.7),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.black),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
