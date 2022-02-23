import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(Spacing.m),
            width: double.infinity,
            color: AppColors.orangeColor.withOpacity(0.9),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.greyColor),
                ),
                const SizedBox(
                  width: Spacing.xl,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Lavkant Kachhwaha',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.whiteColor,
                          fontFamily: "Mulish-SemiBold",
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: Spacing.xs,
                    ),
                    Text(
                      'Kush373@gmail.com',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: Spacing.xs,
                    ),
                    Text(
                      '+91 9009908344',
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
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
                        children: const [
                          Text('Manage \nPayments \nModes',
                              style: TextStyle(
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
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              // shape: BoxShape.circle
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(Spacing.xxl))),
                        )),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              // shape: BoxShape.circle
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
                        )),
                  ],
                ),
                Stack(
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
                        children: const [
                          Text('Manage \nAddresses',
                              style: TextStyle(
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
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              // shape: BoxShape.circle
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
                        )),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              // shape: BoxShape.circle
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(Spacing.xxl))),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                      vertical: Spacing.m, horizontal: 50),
                  width: double.infinity,
                  color: AppColors.greyColor,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Total Orders',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: Spacing.xs,
                            ),
                            Text(
                              '20',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: Spacing.xl,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'In Transit',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: Spacing.xs,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: Spacing.xl,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Delivered',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: Spacing.xs,
                            ),
                            Text(
                              '15',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
