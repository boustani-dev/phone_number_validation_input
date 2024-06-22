import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/country_dial_code.dart';
import '../services/countries_dial_data.dart';
import '../services/services.dart';

class PhoneNumberValidatorInput extends StatelessWidget {
  const PhoneNumberValidatorInput({
    super.key,
    this.height,
    this.autoFocus,
    this.style,
    this.onChanged,
    this.maxLength,
    this.isEnabled,
    this.alignment = TextAlign.start,
    this.focusNode,
    this.validator,
    this.isSecureText = false,
    this.suffixIconPath,
    this.onSuffixIconPressed,
    this.svgSuffixIconColor,
    this.suffixIconWidget,
    this.fillColor = Colors.transparent,
    this.border,
    this.hintStyle,
    this.onTap,
    required this.controller,
    this.emptyFieldErrorMessage,
    this.inValidPhoneNumberErrorMessage,
    this.inValidEmailErrorMessage,
    this.inValidLengthErrorMessage,
    this.labelText,
    this.labelStyle,
    this.errorStyle,
    this.margin,
    this.canAcceptEmail = false,
    this.readOnly,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.minLines,
  }) : type = canAcceptEmail ? TextInputType.text : TextInputType.phone;
  final double? height;
  final double? margin;
  final bool? autoFocus;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? minLines;
  final bool? isEnabled;
  final bool canAcceptEmail;
  final TextAlign alignment;
  final FocusNode? focusNode;
  final TextStyle? style;
  final TextInputType type;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isSecureText;
  final String? labelText;
  final String? suffixIconPath;
  final String? emptyFieldErrorMessage;
  final String? inValidPhoneNumberErrorMessage;
  final String? inValidEmailErrorMessage;
  final String? inValidLengthErrorMessage;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback? onTap;
  final Color? svgSuffixIconColor;
  final Widget? suffixIconWidget;
  final Color fillColor;
  final InputBorder? border;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final bool? readOnly;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin ?? 8.0),
      child: SizedBox(
        height: height ?? _responsiveHeight(context),
        child: TextFormField(
          readOnly: readOnly ?? false,
          // autofocus: autoFocus ?? false,
          onChanged: onChanged,
          maxLength: maxLength,
          enabled: isEnabled ?? true,
          textAlign: alignment,
          focusNode: focusNode,
          style: style ?? const TextStyle(color: Colors.black, fontSize: 10.0),
          keyboardType: type,
          validator: /*validator ??*/ _defaultValidator,
          controller: controller,
          // maxLines: maxLines,
          obscureText: isSecureText,
          decoration: _buildInputDecoration(),
          onTap: onTap,
          textCapitalization: textCapitalization,
          minLines: minLines ?? 1,
        ),
      ),
    );
  }

  double _responsiveHeight(BuildContext context) {
    return responsiveKit(context: context, isTablet: 80, isSmall: 60, etc: 60);
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: labelText,
      suffixIcon: _buildSuffixIcon(),
      counterText: "",
      fillColor: fillColor,
      filled: true,
      border: border ?? _defaultBorder(),
      enabledBorder: border ?? _defaultEnabledBorder(),
      focusedBorder: border ?? _defaultFocusedBorder(),
      hintText: hintText,
      hintStyle:
          hintStyle ?? const TextStyle(color: Colors.grey, fontSize: 10.0),
      errorStyle:
          errorStyle ?? const TextStyle(color: Colors.red, fontSize: 10.0),
      labelStyle:
          labelStyle ?? const TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

  Widget? _buildSuffixIcon() {
    if (suffixIconPath != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onSuffixIconPressed,
        child: suffixIconPath!.endsWith('.svg')
            ? SvgPicture.asset(
                suffixIconPath!,
                colorFilter: ColorFilter.mode(
                    svgSuffixIconColor ?? Colors.black, BlendMode.srcIn),
              )
            : Image.asset(suffixIconPath!),
      );
    } else {
      return suffixIconWidget;
    }
  }

  InputBorder _defaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: Colors.grey),
    );
  }

  InputBorder _defaultEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1.2, color: Colors.grey),
    );
  }

  InputBorder _defaultFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: Colors.grey),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return emptyFieldErrorMessage ?? 'This field cannot be empty';
    }
    if (canAcceptEmail) {
      if (Utils.onlyDigitsValidation.hasMatch(value)) {
        if (!Utils.phoneNumberValidation.hasMatch(value)) {
          return inValidPhoneNumberErrorMessage ??
              'Please enter a valid phone number';
        }
        return _validatePhoneNumber(value);
      } else {
        if (!Utils.emailValidation.hasMatch(value.trim())) {
          return inValidEmailErrorMessage ??
              'Please enter a valid email address';
        }
      }
    } else {
      if (!Utils.phoneNumberValidation.hasMatch(value)) {
        return inValidPhoneNumberErrorMessage ??
            'Please enter a valid phone number';
      }
      return _validatePhoneNumber(value);
    }
    return null;
  }

  String? _validatePhoneNumber(String value) {
    PhoneNumberResult result = identifyCountryCode(value, countryData);
    if (result.countryDialCode != null) {
      bool isValidLength =
          checkPhoneNumberLength(result.strippedNumber, result.countryDialCode);
      if (!isValidLength) {
        return inValidLengthErrorMessage ??
            'The phone number length is not valid.';
      }
    } else {
      return inValidPhoneNumberErrorMessage ?? 'Phone number is not valid';
    }
    return null;
  }
}
