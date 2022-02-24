import 'package:captain_app/blocs/address_bloc/address_bloc.dart';
import 'package:captain_app/shared/widgets/showBottomSheet.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/helper_functions.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return const BottomSheetContainer();
          },
        );
      },
      child: StreamBuilder<bool>(
          stream: addressBloc.loadingStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const SizedBox(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              height: 50,
              width: double.infinity,
              color: AppColors.greyColor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Delivery Date : ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          // color: AppColors.whiteColor
                        )),
                    Text(
                        " ${HelperFunctions.getDateTime(addressBloc.deliveryDate)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: AppColors.whiteColor
                        )),
                    const SizedBox(
                      width: Spacing.m,
                    ),
                    Text("Pin Code :",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          // color: AppColors.whiteColor
                        )),
                    Text(" ${addressBloc.pincodeController.text}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: AppColors.whiteColor
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
