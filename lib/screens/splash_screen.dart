import 'package:flutter/material.dart';

import 'auth/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigatescreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyWidget(),
    ));
  }

  // Future<void> routes() async {
  //   print(await getbool(ISLOGIN));
  //   if (await getbool(ISLOGIN)) {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const HomeScreen(),
  //     ));
  //   } else {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const Onboarding1(),
  //     ));
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(seconds: 3), () {
      navigatescreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/migosplash.jpg",
          height: 300,
          width: 330,
          fit: BoxFit.fill,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
