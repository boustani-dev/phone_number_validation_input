
# Phone Number Validation Input

## Features

- Validate phone numbers based on country dial codes
- Customizable UI elements including text style, border, hint text, and more
- Optional suffix icon with SVG support
- Error messages for empty fields, invalid phone numbers, and invalid length

## Getting started

To start using this package, add phone_number_validation_input to your pubspec.yaml:

```
dependencies:
  phone_number_validation_input: ^1.0.0

```
Then run:
```
flutter pub get
```

## Usage

Here is a basic example of how to use the PhoneNumberValidatorInput widget:

```
import 'package:phone_number_validation_input/phone_number_validation_input.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Validator Input Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PhoneNumberValidatorInput(
          controller: _phoneController,
          hintText: 'e.g., +98 912 345 6789',
          emptyFieldErrorMessage: 'Please enter a phone number',
          inValidPhoneNumberErrorMessage: 'Please enter a valid phone number',
          inValidLengthErrorMessage: 'The phone number length is not valid',
          onChanged: (value) {
            print('Phone number: $value');
          },
        ),
      ),
    );
  }
}
```

## Customization
The PhoneNumberValidatorInput widget provides several properties to customize its appearance and behavior:

- **height:** Height of the input field
- **autoFocus:** Automatically focus the input field
- **style:** Text style for the input field
- **onChanged:** Callback for when the input changes
- **maxLength:** Maximum length of the input
- **isEnabled:** Enable or disable the input field
- **alignment:** Text alignment
- **focusNode:** Focus node for the input field
- **maxLines:** Maximum number of lines
- **isSecureText:** Obscure text for password fields
- **suffixIconPath:** Path to the suffix icon
- **onIconPressed:** Callback for when the suffix icon is pressed
- **svgSuffixIconColor:** Color for the SVG suffix icon
- **suffixIconWidget:** Custom widget for the suffix icon
- **fillColor:** Fill color for the input field
- **border:** Border for the input field
- **hintStyle:** Text style for the hint text
- **labelText:** Label text for the input field
- **margin:** Margin around the input field
- **hintText:** Hint text for the input field
- **emptyFieldErrorMessage:** Error message for empty fields
- **inValidPhoneNumberErrorMessage:** Error message for invalid phone numbers
- **inValidLengthErrorMessage:** Error message for invalid phone number length


Contributions are welcome! Please submit a pull request or open an issue on GitHub.

This project is licensed under the BSD 3-Clause License. See the LICENSE file for details.


