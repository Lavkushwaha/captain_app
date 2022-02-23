import 'package:captain_app/blocs/base_bloc.dart';
import 'package:captain_app/shared/models/item_model.dart';
import 'package:captain_app/shared/repository/item_repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  List<Item>? _items;

  final BehaviorSubject<bool> _loadingController =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStream => _loadingController.stream;

  _getData() async {
    _loadingController.add(true);
    _items = await ItemRepository.getItems();
    debugPrint("_items: $_items");
    _loadingController.add(false);
  }

  Function get getData => _getData;

  List<Item> get items => _items ?? [];

  @override
  void dispose() {
    _loadingController.close();
  }
}

final HomeBloc homeBloc = HomeBloc();
