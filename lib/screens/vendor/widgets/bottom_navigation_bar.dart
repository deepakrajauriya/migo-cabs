import 'package:flutter/material.dart';
import 'package:migo_cabs/screens/vendor/provider/vendor_bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

import '../vendor_job_post_screen.dart';

class BottomNavigationBars extends StatelessWidget {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<VendorBottomNavigationProvider>(
        builder: (context, provider, child) {
      return Container(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  elevation: 0.1,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VendorJobPostScreen(),
                        ));
                  },
                  child: Icon(Icons.add)),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.setcurrentstate(0);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: provider.getcurrentstate() == 0
                              ? Colors.orange
                              : Colors.grey.shade400,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 11,
                            color: provider.getcurrentstate() == 0
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setcurrentstate(1);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: provider.getcurrentstate() == 1
                              ? Colors.orange
                              : Colors.grey.shade400,
                        ),
                        Text(
                          "My Booking",
                          style: TextStyle(
                            fontSize: 11,
                            color: provider.getcurrentstate() == 1
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.20,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setcurrentstate(2);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: provider.getcurrentstate() == 2
                              ? Colors.orange
                              : Colors.grey.shade400,
                        ),
                        Text(
                          "Chats ",
                          style: TextStyle(
                            fontSize: 11,
                            color: provider.getcurrentstate() == 2
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setcurrentstate(3);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: provider.getcurrentstate() == 3
                              ? Colors.orange
                              : Colors.grey.shade400,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 11,
                            color: provider.getcurrentstate() == 3
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
