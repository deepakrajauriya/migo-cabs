import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:migo_cabs/const/app_sizes.dart';
import 'package:migo_cabs/screens/auth/login_screen.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          textAlign: TextAlign.center,
          "WELCOME\nTO",
          style: TextStyle(
              fontFamily: "babae",
              fontSize: 50,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        const Text(
          "TAXI KING",
          style: TextStyle(
              fontFamily: "outfit",
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 260, // Set the desired height of the Lottie animation
          width: AppSizes
              .screenwidth, // Set the desired width of the Lottie animation
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(controller),
            child: Lottie.asset(
              height: 150,
              'assets/lottie/taxi.json',
              fit: BoxFit.contain, // Ensures proportional scaling
              alignment: Alignment.center,
              animate: true,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
              // Add navigation or action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
