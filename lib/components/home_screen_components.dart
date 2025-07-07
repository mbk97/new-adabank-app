import 'package:adabank/screens/chart.dart';
import 'package:adabank/screens/home.dart';
import 'package:adabank/screens/notifications.dart';
import 'package:adabank/screens/wallet.dart';
import 'package:adabank/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget tableItem(BuildContext context) {
  final List<Map<String, String>> itemsTableData = [
    {
      "image": 'assets/images/equip.png',
      "title": "Equipment",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa",
    },
    {
      "image": 'assets/images/ent.png',
      "title": "Entertainment",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa",
    },
    {
      "image": 'assets/images/stream.png',
      "title": "Streaming",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa",
    },
    {
      "image": 'assets/images/food.png',
      "title": "Food",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa",
    },
    {
      "image": 'assets/images/shop.png',
      "title": "Shoping",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa",
    },
    {
      "image": 'assets/images/travel.png',
      "title": "Travel",
      "date": "17 Nov",
      "price": "\$220.98",
      "description": "lorem ipsum warefa",
    },
  ];

  return Column(
    children: itemsTableData.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(item['image']!, fit: BoxFit.contain),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      item['date']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item['price']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item['description']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList(),
  );
}

Widget homeScreenCardContent(BuildContext context) {
  final List cardItems = [
    {"title": "Transfer", "img": "assets/images/transfer.png"},
    {"title": "Top Up", "img": "assets/images/top-up.png"},
    {"title": "Pay Bills", "img": "assets/images/Wallet.svg"},
    {"title": "More", "img": "assets/images/Category.svg"},
  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: cardItems.map((item) {
      final String imgPath = item['img'];
      final bool isSvg = imgPath.toLowerCase().endsWith('.svg');

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSvg
              ? Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0XFFE9FFAB),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SvgPicture.asset(imgPath, width: 40, height: 40),
                )
              : Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0XFFE9FFAB),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.asset(imgPath, width: 40, height: 40),
                ),
          const SizedBox(height: 4),
          Text(
            item['title'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }).toList(),
  );
}

Widget homeScreenUserList(BuildContext context) {
  final List<Map<String, String>> userList = [
    {"image": 'assets/images/ojaman.png', "label": "Ojaman"},
    {"image": 'assets/images/mariana.png', "label": "Mariana"},
    {"image": 'assets/images/jimanti.png', "label": "Jimanti"},
    {"image": 'assets/images/jumin.png', "label": "Jumin"},
  ];

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: userList.map((item) {
      return Column(
        children: [
          Image.asset(item['image']!, fit: BoxFit.contain),
          const SizedBox(height: 5),
          Text(
            item['label']!,
            style: const TextStyle(fontSize: 12, color: Color(0XFF000000)),
          ),
        ],
      );
    }).toList(),
  );
}

Widget homeDraggableSheet(BuildContext context) {
  return DraggableScrollableSheet(
    initialChildSize: 0.4, // Initial size of the draggable sheet
    minChildSize: 0.4, // Minimum size of the sheet
    maxChildSize: 0.87, // Maximum size of the sheet
    builder: (context, scrollController) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              30,
              20,
              30,
              0,
            ), // or smaller bottom
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0XFFbebdc4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.drag_handle,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: const Text(
                    'Send Again',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFFbebdc4),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                homeScreenUserList(context),
                const SizedBox(height: 30),
                const Text(
                  "Transaction History",
                  style: TextStyle(fontSize: 17, color: Color(0XFFbebdc4)),
                ),
                const SizedBox(height: 10),
                tableItem(context),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget reusableBottomScreenNav(BuildContext context, Widget widget) {
  final List<Map<String, dynamic>> navBarIcons = [
    {"Icon": Icons.home_filled, "Widget": const Home()},
    {"Icon": Icons.graphic_eq, "Widget": const Chart()},
    {"Icon": Icons.wallet, "Widget": const Wallet()},
    {"Icon": Icons.notifications, "Widget": const Notifications()},
  ];

  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
          padding: const EdgeInsets.only(right: 18, left: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 40,
                spreadRadius: 40,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navBarIcons.map((icon) {
              final navItem = icon;
              return IconButton(
                iconSize: 30,
                icon: Icon(navItem["Icon"]),
                color: const Color(0XFF000000),
                onPressed: () {
                  if (navItem["Widget"].runtimeType != widget.runtimeType) {
                    navigateTo(
                      context,
                      navItem["Widget"],
                    ); // This ensure it does not navigate to the same page
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
      Positioned(
        bottom: 55, // Adjust this to control the floating height
        left: 0,
        right: 0, // Ensures horizontal centering
        child: Center(
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              // Handle the action of the center button
            },
            backgroundColor: const Color(0XFF09703E),
            elevation: 5, // Add some elevation to make it float
            child: Image.asset("assets/images/Scan.png"),
          ),
        ),
      ),
    ],
  );
}
