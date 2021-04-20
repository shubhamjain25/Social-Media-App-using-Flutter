import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;

  InputField({this.isObscureText, this.hintText});

  @override
  Widget build(BuildContext context) {
    String _hintText = hintText ?? 'Enter details here';
    bool _isObscureText = isObscureText ?? false;
    return TextField(
      obscureText: _isObscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: _hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
