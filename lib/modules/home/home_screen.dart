import 'package:captain_app/blocs/home_bloc/home_bloc.dart';
import 'package:captain_app/shared/widgets/cardListItem.dart';
import 'package:captain_app/shared/widgets/deliverySection.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.getData();

    super.initState();
  }

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
        // GestureDetector(
        //   onTap: () {
        //     showModalBottomSheet<void>(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return const BottomSheetContainer();
        //       },
        //     );
        //   },
        //   child: Container(
        //     height: 50,
        //     width: double.infinity,
        //     color: AppColors.greyColor,
        //   ),
        // ),
        StreamBuilder<bool>(
            stream: homeBloc.loadingStream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && snapshot.data == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData && snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...homeBloc.items
                        .map((e) => CardListItem(item: e))
                        .toList(),
                  ],
                );
              }
            }),

        const SizedBox(
          height: 50,
        )
      ],
    ));
  }
}
