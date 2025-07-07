import 'package:adabank/components/home_screen_components.dart';
import 'package:adabank/screens/chart.dart';
import 'package:adabank/screens/notifications.dart';
import 'package:adabank/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; // Needed for BackdropFilter

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? initialValue = "450,49";
  bool isValueHidden = false;

  handleValChange() {
    setState(() {
      isValueHidden = !isValueHidden;
    });
  }

  final List<Map<String, dynamic>> navBarIcons = [
    {"Icon": Icons.home_filled, "Widget": const Home()},
    {"Icon": Icons.graphic_eq, "Widget": const Chart()},
    {"Icon": Icons.wallet, "Widget": const Wallet()},
    {"Icon": Icons.notifications, "Widget": const Notifications()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0XFF09703E),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    // Header Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Mariana S.",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/images/image_profile.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Card Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(51),
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: Colors.white.withAlpha(77),
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  // Balance Row
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: AnimatedSwitcher(
                                          duration: Duration(milliseconds: 400),
                                          child: Text(
                                            isValueHidden
                                                ? "*****"
                                                : "\$$initialValue",
                                            key: ValueKey(isValueHidden),
                                            style: TextStyle(
                                              fontSize: 44,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: IconButton(
                                          icon: Icon(
                                            isValueHidden
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          onPressed: handleValChange,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  // USD currency blur badge
                                  Center(
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10,
                                          sigmaY: 10,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withAlpha(51),
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                            border: Border.all(
                                              color: Colors.white.withAlpha(77),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Text(
                                                "USD",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Icon(
                                                Icons.arrow_downward_outlined,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 12),
                                  Divider(
                                    color: Colors.white.withAlpha(77),
                                    thickness: 1.5,
                                    indent: 16.0,
                                    endIndent: 16.0,
                                  ),

                                  const SizedBox(height: 12),
                                  // Action Buttons (Transfer, Top Up, etc.)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 8,
                                    ),
                                    child: homeScreenCardContent(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          homeDraggableSheet(context),
          reusableBottomScreenNav(context, widget),
        ],
      ),
    );
  }
}
