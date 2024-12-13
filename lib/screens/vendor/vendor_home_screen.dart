import 'package:flutter/material.dart';
import 'package:migo_cabs/screens/vendor/home_screen_tabs/news_screen.dart';

import 'home_screen_tabs/group_grid_screen.dart';

class VendorHomeScreen extends StatelessWidget {
  const VendorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text(
                  "Migo Cabs",
                  style: TextStyle(
                      fontFamily: "babae",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTab("DUTY", true, () {}),
                  _buildTab("GROUPS", false, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupGridScreen(),
                        ));
                  }),
                  _buildTab("NEWS", false, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(),
                        ));
                  }),
                ],
              ),
              SizedBox(height: 16),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search by booking ID...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Banner
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "REFERRAL AND SHARE\nCHANCE TO WIN BRAND NEW SWIFT CAR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text("Sedan"),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/sedan.png",
                              height: 80,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Bookingcard(),
              SizedBox(height: 16),
              Bookingcard(),
              SizedBox(
                height: 80,
              ),
              // Taxi Details Card
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isSelected, VoidCallback callback) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: !isSelected
                ? Border.all(color: Colors.grey.withOpacity(0.5))
                : null,
            color: isSelected ? Colors.orange : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceInfo(String price, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(price,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget Bookingcard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID-525205 (Open)"),
                Row(
                  children: [
                    Icon(Icons.lock, color: Colors.blue),
                    Text(" Secured"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Tomorrow @ 10:30 AM",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),

            // Route and Car Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jaipur"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.arrow_forward, color: Colors.orange),
                    Text("ONE WAY"),
                  ],
                ),
                Text("Pathankot"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset('assets/images/sedan.png', height: 40),
                SizedBox(
                  width: 10,
                ),
                Text("Sedan"),
              ],
            ),
            SizedBox(height: 8),

            // Pricing Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPriceInfo("₹11,500", "Total Amount"),
                _buildPriceInfo("₹7,500", "Driver's Earning"),
                _buildPriceInfo("₹4,000", "Commission"),
              ],
            ),
            SizedBox(height: 16),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow[700],
                  ),
                  child: Text(
                    "PAY COMMISSION",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "CALL",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
