import 'package:flutter/material.dart';

import '../models/country_dial_code.dart';

PhoneNumberResult identifyCountryCode(
    String phoneNumber, List<CountryDialCode> countryData) {
  // Normalize the phone number
  phoneNumber = phoneNumber.trim().replaceAll(' ', '').replaceAll('-', '');

  // Check if the phone number starts with a '+'
  if (!phoneNumber.startsWith('+')) {
    // throw FormatException('Phone number must start with "+" sign');
  }

  // Try to match the phone number with country codes
  for (var country in countryData) {
    if (phoneNumber.startsWith('+' + country.phone)) {
      // Strip the country code from the phone number
      String strippedNumber =
          phoneNumber.substring(('+' + country.phone).length);
      return PhoneNumberResult(
          countryDialCode: country, strippedNumber: strippedNumber);
    }
  }

  // If no match is found, return null
  return PhoneNumberResult(countryDialCode: null, strippedNumber: phoneNumber);
}

bool checkPhoneNumberLength(String strippedNumber, CountryDialCode? country) {
  if (country == null) {
    return false;
  }
  int length = strippedNumber.length;
  return country.phoneLength.contains(length);
}

class Utils {
  Utils._();
  static var onlyDigitsValidation = RegExp(r'^\+?[0-9]*$');
  static var emailValidation =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static var phoneNumberValidation = RegExp(
      r'^(\+\d{1,2}\s?)?0?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
  static const Size smallDeviceSize = Size(320, 534);
  static const Size tabletDeviceSize = Size(900, 1280);
  static bool isSmall(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width <= smallDeviceSize.width ||
        mediaQuery.size.height <= smallDeviceSize.height;
  }

  static bool isNormal(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return 1280 <= mediaQuery.size.height && 534 <= smallDeviceSize.height;
  }

  static bool isTablet(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.shortestSide >= 900 ? true : false;
  }

  static String? validateEmpty({String? value, String? errorMessage}) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? "This field may not be empty";
    }
    return null;
  }
}

double responsiveKit(
    {required BuildContext context,
    double isTablet = 0,
    double isSmall = 0,
    double etc = 0}) {
  return Utils.isTablet(context)
      ? isTablet
      : Utils.isSmall(context)
          ? isSmall
          : etc;
}
