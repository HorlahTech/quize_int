import 'package:flutter/material.dart';

import 'constants.dart';

class TextFields extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;

  const TextFields({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.validator,
    this.obscureText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          filled: true,
          labelText: labelText,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: primaryColor))),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
