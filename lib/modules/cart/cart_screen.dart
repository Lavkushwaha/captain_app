import 'package:captain_app/blocs/cart_bloc/cart_bloc.dart';
import 'package:captain_app/blocs/home_bloc/home_bloc.dart';
import 'package:captain_app/shared/widgets/cardListItem.dart';
import 'package:captain_app/shared/widgets/deliverySection.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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

        StreamBuilder<bool>(
            stream: cartBloc.loadingController,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData && snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                if (cartBloc.cartItems.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text('No items in cart'),
                        ),
                      ],
                    ),
                  );
                }
                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...homeBloc.items.map((e) {
                      if (cartBloc.cartItems
                          .any((element) => element.id == e.id)) {
                        return CardListItem(item: e);
                      }
                      return const SizedBox();
                    }).toList()
                  ],
                );
              }
            }),

        const SizedBox(
          height: Spacing.xl * 3,
        )
      ],
    ));
  }
}
