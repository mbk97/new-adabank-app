import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget destination) {
  final route = MaterialPageRoute(builder: (context) => destination);
  Navigator.push(context, route);
}
