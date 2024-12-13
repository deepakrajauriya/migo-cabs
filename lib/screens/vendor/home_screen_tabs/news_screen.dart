import 'package:flutter/material.dart';

import '../../widgets/screens_header.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [ScreensHeader(title: 'News')],
      ),
    );
  }
}
