import 'package:flutter/material.dart';
import 'package:migo_cabs/screens/widgets/screens_header.dart';

class CustomerNotificationHistory extends StatelessWidget {
  const CustomerNotificationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [ScreensHeader(title: 'Notifications')],
      ),
    );
  }
}
