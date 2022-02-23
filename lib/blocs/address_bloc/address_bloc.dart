import 'package:captain_app/blocs/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class AddressBloc extends Bloc {
  final TextEditingController _pincodeController = TextEditingController();

  final BehaviorSubject<bool> _loadingController =
      BehaviorSubject.seeded(false);

  DateTime _deliveryDate = DateTime.now();

  TextEditingController get pincodeController => _pincodeController;

  Stream<bool> get loadingStream => _loadingController.stream;

  DateTime get deliveryDate => _deliveryDate;

  Function get updateDeliveryDate => _updateDeliveryDate;

  Function get updatePincode => _updatePincode;

  void submit() {
    _loadingController.add(true);

    _loadingController.add(false);
  }

  _updateDeliveryDate(DateTime date) {
    _loadingController.add(true);

    _deliveryDate = date;
    _loadingController.add(false);
  }

  _updatePincode() {
    _loadingController.add(true);

    // _pincodeController.text = pincode;
    _loadingController.add(false);
  }

  clearPinCode() {
    _pincodeController.clear();
  }

  @override
  void dispose() {
    _loadingController.close();
  }
}

final AddressBloc addressBloc = AddressBloc();
