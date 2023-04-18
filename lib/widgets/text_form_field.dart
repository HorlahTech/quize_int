import 'package:flutter/material.dart';

import '../constants.dart';

class TextFields extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const TextFields({
    Key? key,
    required this.labelText,
     this.hintText,
    required this.controller,
    required this.validator,
    this.obscureText,
    this.keyboardType = TextInputType.text,
    this.textInputAction ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
          // focusedBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.black ,width: 0.5)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          filled: true,
          labelText: labelText,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black54, width: 1))),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,

    );
  }
}
