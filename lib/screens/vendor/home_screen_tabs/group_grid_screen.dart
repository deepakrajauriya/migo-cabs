import 'package:flutter/material.dart';
import 'package:migo_cabs/const/app_sizes.dart';
import 'package:migo_cabs/screens/vendor/home_screen_tabs/view_all_group_screen.dart';

import '../../widgets/screens_header.dart';

class GroupGridScreen extends StatelessWidget {
  final List<Map<String, dynamic>> gridData = [
    {'count': 40, 'state': "DELHI", 'icon': Icons.local_taxi},
    {'count': 4, 'state': "UTTAR PRADESH", 'icon': Icons.local_taxi},
    {'count': 8, 'state': "MADHYA PRADESH", 'icon': Icons.local_taxi},
    {'count': 12, 'state': "UTTRAKHAND", 'icon': Icons.local_taxi},
    {'count': 2, 'state': "BIHAR", 'icon': Icons.local_taxi},
    {'count': 77, 'state': "MAHARASHTRA", 'icon': Icons.local_taxi},
    {'count': 45, 'state': "CHATTISGARH", 'icon': Icons.local_taxi},
    {'count': 63, 'state': "RAJASTHAN", 'icon': Icons.local_taxi},
    {'count': 11, 'state': "GUJRAT", 'icon': Icons.local_taxi},
    {'count': 23, 'state': "WEST BENGAL", 'icon': Icons.local_taxi},
    {'count': 77, 'state': "JHARKHAND", 'icon': Icons.local_taxi},
    {'count': 1, 'state': "TELANGANA", 'icon': Icons.local_taxi},
  ];

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content (Banner + Grid)
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80), // Leave space for the fixed header
                // Banner Section
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: AppSizes.screenwidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/ban3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Grid Section
                GridView.builder(
                  padding: const EdgeInsets.all(16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1, // Adjust for item size
                  ),
                  itemCount: gridData.length,
                  itemBuilder: (context, index) {
                    final item = gridData[index];
                    return _buildGridItem(
                        item['count'], item['state'], item['icon'], context);
                  },
                ),
              ],
            ),
          ),
          // Fixed header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Background for the header
              child: ScreensHeader(title: 'Groups'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(
      int count, String state, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewAllGroupScreen(city: state),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/taxi.png",
              height: 50,
              width: 50,
            ), // Icon
            SizedBox(height: 8),
            Text(
              "$count",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange),
            ), // Count
            Text(state,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500)), // State Name
            const SizedBox(height: 8),
            const Text(
              "View All",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 14,
              ),
            ), // View All Button
          ],
        ),
      ),
    );
  }
}
