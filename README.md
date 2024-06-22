
# Phone Number Validation Input

## Features

- Validate phone numbers based on country dial codes
- Ability to accept email address
- Can be used as a simple TextField
- Customizable UI elements including text style, border, hint text, and more

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
		  canAcceptEmail: false,
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

- **height:** Height of the input field.
- **cursorHeight:** Height of the cursor.
- **margin:** Margin around the input field.
- **autoFocus:** Automatically focus the input field.
- **style:** Text style for the input field.
- **onChanged:** Callback for when the input changes.
- **maxLength:** Maximum length of the input.
- **minLines:** Minimum number of lines for the input field.
- **isEnabled:** Enable or disable the input field.
- **canAcceptEmail:** Allow the input field to accept email addresses.
- **alignment:** Text alignment.
- **focusNode:** Focus node for the input field.
- **type:** Text input type.
- **validator:** Validator function for the input field.
- **controller:** Controller for the input field.
- **maxLines:** Maximum number of lines for the input field.
- **isSecureText:** Obscure text for password fields.
- **labelText:** Label text for the input field.
- **suffixIconPath:** Path to the suffix icon.
- **emptyFieldErrorMessage:** Error message for empty fields.
- **inValidPhoneNumberErrorMessage:** Error message for invalid phone numbers.
- **inValidEmailErrorMessage:** Error message for invalid email addresses.
- **inValidLengthErrorMessage:** Error message for invalid phone number length.
- **onSuffixIconPressed:** Callback for when the suffix icon is pressed.
- **onTap:** Callback for when the input field is tapped.
- **svgSuffixIconColor:** Color for the SVG suffix icon.
- **suffixIconWidget:** Custom widget for the suffix icon.
- **fillColor:** Fill color for the input field.
- **cursorColor:** Color of the cursor.
- **cursorErrorColor:** Color of the cursor when an error occurs.
- **border:** Border for the input field.
- **hintText:** Hint text for the input field.
- **hintStyle:** Text style for the hint text.
- **labelStyle:** Text style for the label text.
- **errorStyle:** Text style for the error messages.
- **readOnly:** Make the input field read-only.
- **canRequestFocus:** Allow the input field to request focus.
- **textCapitalization:** Text capitalization behavior for the input field.


Contributions are welcome! Please submit a pull request or open an issue on GitHub.



