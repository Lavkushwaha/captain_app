import 'package:captain_app/blocs/address_bloc/address_bloc.dart';
import 'package:captain_app/utils/helper_functions.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({Key? key}) : super(key: key);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      debugPrint('Date selected: ${picked.toString()}');
      addressBloc.updateDeliveryDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                selectDate(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Delivery Date'),
                  const SizedBox(
                    width: Spacing.m,
                  ),
                  StreamBuilder<bool>(
                      stream: addressBloc.loadingStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data == true) {
                          return const SizedBox(
                            width: Spacing.m,
                            height: Spacing.m,
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Text(HelperFunctions.getDateTime(
                            addressBloc.deliveryDate));
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: Spacing.m,
            ),
            Container(
              width: 200,
              child: TextFormField(
                maxLength: 6,
                controller: addressBloc.pincodeController,
                // onChanged: (txt) {
                //   addressBloc.updatePincode(txt);
                // },
                decoration: const InputDecoration(
                  hintText: 'Pincode',
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: Spacing.m,
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                addressBloc.updatePincode();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
