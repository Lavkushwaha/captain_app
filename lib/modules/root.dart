import 'package:badges/badges.dart';
import 'package:captain_app/blocs/cart_bloc/cart_bloc.dart';
import 'package:captain_app/modules/cart/cart_screen.dart';
import 'package:captain_app/modules/categories/categories_screen.dart';
import 'package:captain_app/modules/home/home_screen.dart';
import 'package:captain_app/modules/user/user_screen.dart';
import 'package:captain_app/shared/models/item_model.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int? _bottomNavIndex = 0;
  int? _initialIndex;

  int? get initialIndex => _initialIndex;

  Widget? _screenToDisplay;

  void _onItemTapped(int? newIdx, int? oldIdx) {
    _bottomNavIndex = newIdx;

    switch (newIdx) {
      case home:
        _initialIndex = 0;
        _screenToDisplay = const HomeScreen();
        break;
      case categories:
        _initialIndex = 0;
        _screenToDisplay = const CategoriesScreen();
        break;
      case cart:
        _initialIndex = 0;
        _screenToDisplay = const CartScreen();
        break;

      case user:
        _initialIndex = 0;
        _screenToDisplay = const UserScreen();
        break;

      default:
        _screenToDisplay = const HomeScreen();

        break;
    }

    setState(() {});
  }

  @override
  void initState() {
    _onItemTapped(_bottomNavIndex, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (int idx) => _onItemTapped(idx, _bottomNavIndex),
          currentIndex: _bottomNavIndex!,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: StreamBuilder<List<Item>>(
                  stream: cartBloc.cartItemsStream,
                  builder: (context, snapshot) {
                    int itemCount = cartBloc.getCartTotal();

                    if (snapshot.hasData && itemCount == 0) {
                      return const Icon(Icons.shopping_bag_outlined);
                    }
                    return Stack(
                      children: [
                        const Icon(Icons.shopping_bag_outlined),
                        Positioned(
                            child: Badge(
                          badgeContent: Text(
                            itemCount.toString(),
                            style: const TextStyle(color: AppColors.whiteColor),
                          ),
                          child: const Icon(Icons.shopping_bag_outlined),
                        ))
                      ],
                    );
                  }),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              label: 'User',
            ),
          ],
        ),
        body: _screenToDisplay,
      ),
    );
  }
}
