import 'package:flutter/material.dart';
import 'package:migo_cabs/screens/widgets/screens_header.dart';

class CustomerHistoryScreen extends StatelessWidget {
  const CustomerHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [ScreensHeader(title: "History")],
      ),
    );
  }
}
