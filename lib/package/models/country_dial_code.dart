class CountryDialCode {
  final String label;
  final String phone;
  final String code;
  final List<int> phoneLength;

  CountryDialCode({
    required this.label,
    required this.phone,
    required this.code,
    required this.phoneLength,
  });
}

class PhoneNumberResult {
  final CountryDialCode? countryDialCode;
  final String strippedNumber;

  PhoneNumberResult(
      {required this.countryDialCode, required this.strippedNumber});
}
