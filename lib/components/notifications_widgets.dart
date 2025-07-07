import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget verificationWidget(BuildContext context) {
  final List<Map<String, dynamic>> verifications = [
    {
      "text": "Personal Information",
      "subText":
          "Please confirm your email for further data security and completeness",
      "image": "assets/images/frame.svg",
    },
    {
      "text": "Confirm Email",
      "subText": "complete your name and profile photo complete the data",
      "image": "assets/images/sms.png",
    },
  ];
  return Expanded(
    child: ListView.builder(
      itemCount: verifications.length,
      itemBuilder: (context, index) {
        final item = verifications[index];
        final String imgPath = item['image'];
        final bool isSvg = imgPath.toLowerCase().endsWith('.svg');
        return Column(
          children: [
            ListTile(
              leading: !isSvg
                  ? Image.asset(item["image"], width: 40, height: 40)
                  : SvgPicture.asset(item["image"], width: 40, height: 40),
              title: Text(
                item["text"],
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              subtitle: Text(
                item["subText"],
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0XFF09703E),
                size: 10,
              ),
            ),
            if (index < verifications.length - 1)
              Divider(color: Colors.grey.shade300, thickness: 1),
          ],
        );
      },
    ),
  );
}

Widget transactionWidget(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  final List<Map<String, dynamic>> notifications = [
    {
      "text": "successful transaction to ojaman, view and download the receipt",
      "date": "September 4",
      "image": "assets/images/receipt-text.svg",
    },
    {
      "text": "successful transaction to ojaman, view and download the receipt",
      "date": "September 2",
      "image": "assets/images/receipt-text.svg",
    },
    {
      "text": "successful transaction to ojaman, view and download the receipt",
      "date": "September 1",
      "image": "assets/images/receipt-text.svg",
    },
  ];
  return Expanded(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transactions",
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(color: Colors.grey.shade300, thickness: 1),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                final String imgPath = item['image'];
                final bool isSvg = imgPath.toLowerCase().endsWith('.svg');
                return Column(
                  children: [
                    ListTile(
                      leading: isSvg
                          ? SvgPicture.asset(
                              item["image"],
                              width: 40,
                              height: 40,
                            )
                          : Image.asset(item["image"], width: 40, height: 40),
                      title: Text(
                        item["text"],
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      subtitle: Text(
                        item["date"],
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      trailing: Icon(
                        Icons.close,
                        color: Color(0XFF09703E),
                        size: 10,
                      ),
                    ),
                    if (index < notifications.length - 1)
                      Divider(color: Colors.grey.shade300, thickness: 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget progressWidget(BuildContext context) {
  return Container(
    height: 8,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFF09703E).withAlpha(51),
      borderRadius: BorderRadius.circular(10),
    ),
    child: FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.6, // 60% progress
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF09703E),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
