import 'package:flutter/material.dart';

import '../../widgets/screens_header.dart';

class ViewAllGroupScreen extends StatelessWidget {
  final String city;
  const ViewAllGroupScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [ScreensHeader(title: city)],
      ),
    );
  }
}
