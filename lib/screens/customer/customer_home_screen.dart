import 'package:flutter/material.dart';
import 'package:migo_cabs/const/app_sizes.dart';
import 'package:migo_cabs/screens/customer/customer_bottom_screens/customer_history_screen.dart';
import 'package:migo_cabs/screens/customer/customer_profile_update.dart';
import 'package:migo_cabs/screens/customer/home_screen_tabs/airport_transfers_screen.dart';
import 'package:migo_cabs/screens/customer/home_screen_tabs/hourly_rentals_screen.dart';
import 'package:migo_cabs/screens/customer/home_screen_tabs/round_trip_screen.dart';

import 'customer_bottom_screens/customer_notification_history.dart';
import 'customer_widgets/customer_navigation_drawer.dart';
import 'home_screen_tabs/one_way_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 27,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        title: const Text(
          "Taxi King",
          style: TextStyle(
              fontFamily: "babae",
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.orange,
              size: 27,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/icons/profile.png"),
              radius: 15,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              child: Text(
                "WELCOME,",
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Explore our professional cab services for your travel needs.",
                style: TextStyle(
                    fontFamily: "roboto",
                    fontSize: 16,
                    color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildServiceCard(
                      icon: Icons.map,
                      label: "Outstation\nOne Way",
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OneWayScreen(),
                            ));
                      }),
                  _buildServiceCard(
                      icon: Icons.location_on,
                      label: "Outstation\nRound Trip",
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoundTripScreen(),
                            ));
                      }),
                  _buildServiceCard(
                    icon: Icons.access_time,
                    label: "Hourly\nRentals",
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HourlyRentalsScreen(),
                          ));
                    },
                  ),
                  _buildServiceCard(
                      icon: Icons.airplanemode_active,
                      label: "Airport\nTransfers",
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AirportTransfersScreen(),
                            ));
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "OUR QUALITY\nYOUR CONVENIENCE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.home,
              color: Colors.orange,
              size: 26,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerNotificationHistory(),
                    ));
              },
              child: const Icon(
                Icons.notifications,
                color: Colors.grey,
                size: 26,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerHistoryScreen(),
                    ));
              },
              child: const Icon(
                Icons.history,
                color: Colors.grey,
                size: 26,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerProfileUpdate(),
                    ));
              },
              child: const Icon(
                Icons.person,
                color: Colors.grey,
                size: 26,
              ),
            ),
          ],
        ),
      ),
      drawer: const MyNavigationDrawer(),
    );
  }

  Widget _buildServiceCard(
      {required IconData icon,
      required String label,
      required VoidCallback callback}) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
