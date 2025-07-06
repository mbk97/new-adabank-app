import 'package:adabank/screens/pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String selectedValue = '+234'; // Default value for the dropdown
  String phoneNumber = '';
  final List<String> regionNumbers = [
    '+234',
    '+233',
    '+222',
    '011',
    '+44',
    "+1",
  ];

  // 🔹 Handle Dropdown change
  void handleDropdownChange(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedValue = newValue;
      });
    }
  }

  // 🔹 Handle TextField change
  void handlePhoneNumberChange(String value) {
    setState(() {
      phoneNumber = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: true, // Important!
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).viewInsets.bottom +
                    30, // Push up when keyboard shows
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Image.asset(
                                  "assets/images/Logo.png",
                                  height: 50,
                                  width: 50,
                                ),
                                const Text(
                                  "AdaBank",
                                  style: TextStyle(
                                    color: Color(0xFF09703E),
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Enter your mobile number for Continue",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF080422),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0XFF09703E),
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      child: DropdownButton<String>(
                                        value: selectedValue,
                                        underline: const SizedBox(),
                                        isExpanded: true,
                                        items: regionNumbers.map((
                                          String value,
                                        ) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: handleDropdownChange,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    flex: 8,
                                    child: TextField(
                                      cursorColor: const Color(0XFF09703E),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0XFF09703E),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0XFF09703E),
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      onChanged: handlePhoneNumberChange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: const Color(0XFFF6F6F6),
                                builder: (context) => ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                  child: Container(
                                    height: 357,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF6F6F6),
                                    ),
                                    child: Stack(
                                      children: [
                                        // Top-only border using Positioned Container
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 2,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Actual content
                                        PinScreen(selectedValue, phoneNumber),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF09703E),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
