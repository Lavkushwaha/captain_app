import 'package:captain_app/blocs/cart_bloc/cart_bloc.dart';
import 'package:captain_app/shared/models/item_model.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class AddtoCardSection extends StatefulWidget {
  final Item? item;
  const AddtoCardSection({Key? key, this.item}) : super(key: key);

  @override
  _AddtoCardSectionState createState() => _AddtoCardSectionState();
}

class _AddtoCardSectionState extends State<AddtoCardSection> {
  @override
  Widget build(BuildContext context) {
    return

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         print('Add to cart');
        //       },
        //       child: const Text(
        //         "Add to cart",
        //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
        //       ),
        //     ),
        //   ],
        // ),

        StreamBuilder<List<Item>>(
            stream: cartBloc.cartItemsStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
              int itemCount = cartBloc.itemCount(widget.item);

              if (snapshot.hasData && itemCount == 0) {
                return Container(
                    width: 100,
                    // height: 30,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.s, vertical: Spacing.xs),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(Spacing.m)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cartBloc.addToCart(widget.item);
                            debugPrint('Add to cart');
                          },
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ));
              }

              return Container(
                  width: 100,
                  // height: 30,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.s, vertical: Spacing.xs),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Spacing.m)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartBloc.addToCart(widget.item);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.orangeColor,
                        ),
                      ),
                      Text(
                        itemCount.toString(),
                        style: const TextStyle(
                            fontSize: Spacing.m, fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartBloc.removeFromCart(widget.item);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.orangeColor,
                        ),
                      ),
                    ],
                  ));
            });
  }
}
