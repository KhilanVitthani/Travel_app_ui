import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/util/const.dart';

TextFormField getTextField({
  String? hintText,
  String? labelText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  double? borderRadius,
  Widget? suffixIcon,
  double? size = 70,
  Widget? suffix,
  Color? borderColor,
  Color? fillColor,
  bool isFilled = false,
  Color? labelColor,
  TextInputType textInputType = TextInputType.name,
  TextInputAction textInputAction = TextInputAction.next,
  bool textVisible = false,
  bool readOnly = false,
  VoidCallback? onTap,
  int maxLine = 1,
  String errorText = "",
  Function(String)? onChange,
  FormFieldValidator<String>? validation,
  double fontSize = 15,
  double hintFontSize = 14,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  return TextFormField(
    controller: textEditingController,
    obscureText: textVisible,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    textCapitalization: textCapitalization,
    cursorColor: Constants.lightAccent,
    readOnly: readOnly,
    validator: validation,
    onTap: onTap,
    maxLines: maxLine,
    onChanged: onChange,
    style: TextStyle(
      fontSize: fontSize,
    ),
    decoration: InputDecoration(
      fillColor: fillColor ?? Constants.lightAccent,
      filled: isFilled,
      labelText: labelText,
      labelStyle: TextStyle(
          color: labelColor ?? Colors.grey.shade500,
          fontWeight: FontWeight.w600),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Constants.lightAccent),
        borderRadius:
            BorderRadius.circular((borderRadius == null) ? 5 : borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular((borderRadius == null) ? 5 : borderRadius),
        borderSide: BorderSide(color: borderColor ?? Constants.lightAccent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular((borderRadius == null) ? 5 : borderRadius),
        borderSide: BorderSide(color: borderColor ?? Constants.lightAccent),
      ),
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular((borderRadius == null) ? 5 : borderRadius),
      ),
      contentPadding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: size! / 2, // HERE THE IMPORTANT PART
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorMaxLines: 2,
      errorText: (errorText != null) ? null : errorText,
      hintText: hintText,
      hintStyle: TextStyle(fontSize: hintFontSize, color: Colors.grey.shade500),
    ),
  );
}
