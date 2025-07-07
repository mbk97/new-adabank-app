import 'package:adabank/components/layout_widget.dart';
import 'package:adabank/components/notifications_widgets.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BaseLayout(
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFF6F6F6),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                transactionWidget(context),
                SizedBox(height: screenHeight * 0.03),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Complete Verification",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "60%",
                              style: TextStyle(color: Color(0XFF09703E)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        progressWidget(context),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey.shade300, thickness: 1),
                        const SizedBox(height: 10),
                        verificationWidget(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
