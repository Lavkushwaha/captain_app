import 'package:captain_app/shared/data/list_data.dart';
import 'package:captain_app/shared/models/item_model.dart';
import 'package:get/get_connect.dart';

class ItemRepository {
  static Future<List<Item>> getItems() async {
    final response = await Future.delayed(Duration(milliseconds: 100), () {
      return Response(statusCode: 200, body: list_data);
    });

    if (response.statusCode == 200) {
      // List<Map<String,Object>>? items = json.decode(response.body);

      return response.body!.map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
