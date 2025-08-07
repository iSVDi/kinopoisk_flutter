import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.suffixIcon,
  });

  final String placeholder;
  final Function(String p1) onChanged;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(),

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.tealAccent,
        border: OutlineInputBorder(),
        // hintStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
        labelText: placeholder,
        floatingLabelStyle: TextStyle(color: Colors.tealAccent),
      ),
      onChanged: onChanged,
    );
  }
}
