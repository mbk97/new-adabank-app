import 'package:adabank/screens/home.dart';
import 'package:adabank/screens/set_pin.dart';
import 'package:adabank/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Widget buildPinInputField(BuildContext context, String pageTitle) {
  final defaultPinTheme = PinTheme(
    width: 55,
    height: 59,
    textStyle: const TextStyle(fontSize: 24, color: Colors.white),
    decoration: BoxDecoration(
      color: const Color(0xFF09703E), // Green background
      borderRadius: BorderRadius.circular(15), // Rounded corners
    ),
  );

  return Pinput(
    length: 4,
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: const Color(0xFF0B8A4A), // Slightly lighter green on focus
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
    ),
    submittedPinTheme: defaultPinTheme,
    keyboardType: TextInputType.number,
    obscureText: false, // Set to true if you want PIN dots
    onCompleted: (pin) {
      FocusScope.of(context).unfocus(); // Hide keyboard on completion
      if (pageTitle == "PIN") {
        navigateTo(context, Home());
      } else {
        navigateTo(context, SetPin());
      }
    },
    showCursor: true,
    cursor: Container(width: 2, height: 24, color: Colors.white),
  );
}
