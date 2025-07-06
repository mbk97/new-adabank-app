import 'package:adabank/screens/login.dart';
import 'package:adabank/utils/navigate.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF09703E)),
        child: Stack(
          children: [
            // Background Ellipses that touch the left edge
            Positioned(
              top: -120,
              left: -120,
              child: Image.asset('assets/images/Ellipse 1.png'),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/Ellipse 2.png',
                fit: BoxFit.cover,
              ),
            ),

            // Wallet image centered on top of ellipses
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/wallet-img-welcome-screen.png',
                alignment: Alignment.center,
              ),
            ),

            // Floating white container with margin
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 28),
                    Center(
                      child: Text(
                        "Start payments easily",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "in the digital age",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                        bottom: 30,
                      ),
                      child: Text(
                        "Payment tool that is easy and fast to use\n"
                        "in this easy-to-use digital era.\n"
                        "Use the features that make your\n"
                        "business easier",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF09703E),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          navigateTo(context, const Login());
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
