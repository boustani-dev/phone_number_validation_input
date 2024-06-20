import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/country_dial_code.dart';
import '../services/countries_dial_data.dart';
import '../services/services.dart';

class PhoneNumberValidatorInput extends StatelessWidget {
  PhoneNumberValidatorInput(
      {super.key,
      this.height,
      this.autoFocus = false,
      this.style,
      this.onChanged,
      this.maxLength,
      this.isEnabled,
      this.alignment = TextAlign.start,
      this.focusNode,
      this.maxLines = 1,
      this.isSecureText = false,
      this.suffixIconPath,
      this.onIconPressed,
      this.svgSuffixIconColor,
      this.suffixIconWidget,
      this.fillColor = Colors.transparent,
      this.border,
      this.hintStyle,
      this.type = TextInputType.phone,
      required this.controller,
      this.emptyFieldErrorMessage,
      this.inValidPhoneNumberErrorMessage,
      this.inValidLengthErrorMessage,
      this.labelText,
      this.margin,
      this.hintText = 'e.g., +98 912 345 6789'});
  final double? height;
  final double? margin;
  final bool? autoFocus;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool? isEnabled;
  TextAlign? alignment;
  FocusNode? focusNode;
  final TextStyle? style;
  TextInputType? type;
  final TextEditingController controller;
  final int maxLines;
  final bool isSecureText;
  String? labelText;
  final String? suffixIconPath;
  final String? emptyFieldErrorMessage;
  final String? inValidPhoneNumberErrorMessage;
  final String? inValidLengthErrorMessage;
  final VoidCallback? onIconPressed;
  final Color? svgSuffixIconColor;
  final Widget? suffixIconWidget;
  final Color? fillColor;
  final InputBorder? border;
  String? hintText;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin ?? 8.0),
      child: SizedBox(
        height: height ??
            responsiveKit(context: context, isTablet: 80, isSmall: 60, etc: 60),
        child: TextFormField(
          autofocus: autoFocus ?? false,
          onChanged: onChanged,
          maxLength: maxLength,
          enabled: isEnabled ?? true,
          textAlign: alignment ?? TextAlign.start,
          focusNode: focusNode,
          style: style ?? const TextStyle(color: Colors.black, fontSize: 10.0),
          keyboardType: type,
          validator: (_) {
            String? result = Utils.validateEmpty(
                value: controller.text, errorMessage: emptyFieldErrorMessage);
            if (result != null) return result;

            if (!Utils.phoneNumberValidation.hasMatch(controller.text)) {
              return inValidPhoneNumberErrorMessage ??
                  'please enter a valid phone number';
            }

            if (Utils.phoneNumberValidation.hasMatch(controller.text)) {
              //checks if the phone number is valid
              PhoneNumberResult result =
                  identifyCountryCode(controller.text, countryData);
              if (result.countryDialCode != null) {
                bool isValidLength = checkPhoneNumberLength(
                    result.strippedNumber, result.countryDialCode);
                if (!isValidLength) {
                  return inValidLengthErrorMessage ??
                      'The phone number length is not valid.';
                }
              } else {
                return inValidPhoneNumberErrorMessage ??
                    "Phone number is not valid ";
              }
            }
            return null;
          },
          controller: controller,
          maxLines: maxLines,
          obscureText: isSecureText,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: suffixIconPath != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: onIconPressed,
                    child: suffixIconPath!.endsWith('.svg')
                        ? SvgPicture.asset(
                            suffixIconPath!,
                            colorFilter: ColorFilter.mode(
                                svgSuffixIconColor ?? Colors.black,
                                BlendMode.srcIn),
                          )
                        : Image.asset(suffixIconPath!),
                  )
                : suffixIconWidget,
            counterText: "",
            fillColor: fillColor,
            filled: true,
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1.2,
                    color: Colors.grey,
                  ),
                ),
            focusedBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors
                        .grey, // You can change the color to your desired color
                  ),
                ),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(color: Colors.grey, fontSize: 10.0),
            errorStyle: const TextStyle(color: Colors.red, fontSize: 10.0),
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 10.0),
          ),
        ),
      ),
    );
  }
}
