import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItemsOne = [
      {'image': 'assets/images/transfer.png', 'title': 'Send Money'},
      {'image': 'assets/images/top-up.png', 'title': 'Top-up Walleet'},
      {'image': 'assets/images/wallet.svg', 'title': 'Bill Payment'},
      {'image': 'assets/images/scan.png', 'title': 'Code QR'},
    ];

    return Scaffold(
      backgroundColor: const Color(0XFF09703E),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 25,
                      color: Color(0xFF09703E),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: menuItemsOne.length,
                itemBuilder: (context, index) {
                  final item = menuItemsOne[index];
                  final String imgPath = item['image'];
                  final bool isSvg = imgPath.toLowerCase().endsWith('.svg');

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          menuItemsOne[index]['image'],
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          menuItemsOne[index]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
