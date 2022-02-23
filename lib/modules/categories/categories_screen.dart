import 'package:captain_app/modules/categories/component/category.dart';
import 'package:captain_app/shared/widgets/deliverySection.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      primary: true,
      children: [
        const SizedBox(
          height: Spacing.xl * 2,
        ),
        // Text('Home'),
        const DeliverySection(),
        const SizedBox(
          height: Spacing.xl * 3,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Category(
              title: "Fish",
            ),
            Category(
              title: "Muttton",
            ),
          ],
        ),

        const SizedBox(
          height: Spacing.xl * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Category(
              title: "Chicken",
            ),
            Category(
              title: "Eggs",
            ),
          ],
        ),

        const SizedBox(
          height: Spacing.xl * 3,
        )
      ],
    ));
  }
}
