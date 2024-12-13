import 'package:flutter/material.dart';
import 'package:migo_cabs/const/app_sizes.dart';

class ScreensHeader extends StatelessWidget {
  final String title;
  const ScreensHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Column(
      children: [
        Container(
          height: 70,
          width: AppSizes.screenwidth,
          color: Colors.white,
          // color: Colors.grey[200],
          child: Stack(
            children: [
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.orange,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
