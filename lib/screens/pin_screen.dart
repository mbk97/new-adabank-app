import 'package:flutter/material.dart';
import 'package:adabank/components/pin_input.dart';

class PinScreen extends StatefulWidget {
  final String selectedValue;
  final String phoneNumber;

  const PinScreen(this.selectedValue, this.phoneNumber, {super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 👈️ Important for keyboard interaction
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Verification Code",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    "We have sent the code verification to.\n your mobile number.",
                              ),
                              TextSpan(
                                text: " Wrong number ?",
                                style: const TextStyle(
                                  color: Color(0xFF09703E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF09703E),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "${widget.selectedValue} ${widget.phoneNumber}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      buildPinInputField(context, 'verification'),
                      const SizedBox(height: 10),
                      Text(
                        "Resend Code in 0.7s",
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
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
