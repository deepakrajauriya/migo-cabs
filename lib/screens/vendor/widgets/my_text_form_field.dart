import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migo_cabs/const/app_sizes.dart';

class MyTextformField extends StatelessWidget {
  const MyTextformField({
    super.key,
    this.controller,
    this.validator,
    this.keyBoard,
    this.obscureText = false,
    this.suffix,
    this.enabled,
    this.maxLength,
    this.inputColor = Colors.black,
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.maxLine,
    this.prefix,
    this.filled = true,
    this.filledColor = const Color.fromRGBO(250, 250, 250, 1),
    this.onChanged,
    this.borderColor = const Color.fromRGBO(189, 189, 189, 1),
    this.vPadding = 15,
    this.inputFormatters,
    this.focusNode,
    this.label,
    this.hintColor = Colors.grey,
    this.isreadable = false,
  });

  final bool isreadable;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyBoard;
  final bool? obscureText;
  final Widget? suffix;
  final bool? enabled;
  final bool? filled;
  final int? maxLength;
  final int? maxLine;
  final Color? inputColor;
  final Color? filledColor;
  final Color? borderColor;
  final String? hintText;
  final Color? hintColor;
  final String? label;
  final TextCapitalization? textCapitalization;
  final Widget? prefix;
  final double? vPadding;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return TextFormField(
        textAlignVertical: TextAlignVertical.top,
        enabled: enabled,
        maxLines: maxLine,
        readOnly: isreadable,
        style: TextStyle(color: inputColor, fontSize: 16, fontFamily: 'medium'),
        maxLength: maxLength,
        cursorColor: Colors.orange,
        keyboardType: keyBoard,
        controller: controller,
        textCapitalization: textCapitalization!,
        validator: validator,
        obscureText: obscureText!,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        focusNode: focusNode,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: prefix,
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontFamily: 'medium',
              fontWeight: FontWeight.w500),
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 15, color: hintColor, fontFamily: 'medium'),
          counterText: "",
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.screenwidth * 0.04, vertical: vPadding!),
          suffixIcon: suffix,
          filled: filled,
          fillColor: filledColor,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor!)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1.4, color: Colors.orange.withOpacity(0.4))),
        ));
  }
}
