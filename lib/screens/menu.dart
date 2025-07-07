import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItemsOne = [
      {'image': 'assets/images/transfer.png', 'title': 'Send Money'},
      {'image': 'assets/images/top-up.png', 'title': 'Top-up Wallet'},
      {'image': 'assets/images/Wallet.svg', 'title': 'Bill Payment'},
      {'image': 'assets/images/Scan2.png', 'title': 'Code QR'},
    ];

    return Scaffold(
      backgroundColor: const Color(0XFF09703E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Color(0xFF09703E),
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                "Shortcuts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: menuItemsOne.length,
                  itemBuilder: (context, index) {
                    final item = menuItemsOne[index];
                    final String imgPath = item['image'];
                    final bool isSvg = imgPath.toLowerCase().endsWith('.svg');

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero, // Align left
                        leading: Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: const Color(0XFFE9FFAB),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: isSvg
                              ? SvgPicture.asset(imgPath, fit: BoxFit.contain)
                              : Image.asset(imgPath, fit: BoxFit.contain),
                        ),
                        title: Text(
                          item["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              Divider(
                color: Colors.white.withAlpha(77),
                thickness: 1.5,
                indent: 16.0,
                endIndent: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
