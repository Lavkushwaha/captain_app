import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String? title;
  const Category({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(Spacing.m),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Order \n${title.toString()} \nNow',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Mulish-SemiBold",
                      fontWeight: FontWeight.w900)),
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  // shape: BoxShape.circle
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
            )),
        Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  // shape: BoxShape.circle
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Spacing.xxl))),
            )),
      ],
    );
  }
}
