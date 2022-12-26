import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText, labelText, helperText;
  final IconData? icon, suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,

      // get values
      onChanged: ( String value ) => formValues[formProperty] = value,

      // validate func
      validator: ( String? value ) {

        if ( value == null ) {
          return 'The field is required';
        }

        if ( value.length < 3 ) {
          return 'Minimum 3 words';
        }

        return null;
      },

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon != null ? Icon( suffixIcon ) : null,
        icon: icon != null ? Icon( icon ) : null,
      ),
    );
  }
}