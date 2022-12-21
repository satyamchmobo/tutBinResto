import 'package:hive/hive.dart';
import 'package:tutorbin/business_logic/models/item_details_model.dart';
part 'menu_local_model.g.dart';

@HiveType(typeId: 1)
class MenuLocal {
  MenuLocal({
    required this.listOfItemCategoryMaps,
  });

  factory MenuLocal.fromJson(Map<String, List<Map<String, dynamic>>> json) {
    final List<Map<String, List<ItemDetails>>> listOfItemCategoryMapsTemp =
        (json)
            .entries
            .map(
              (entry) => {
                entry.key.toString(): [
                  ...List.generate((entry.value).length, (index) {
                    return ItemDetails.fromJson(entry.value[index]);
                  })
                ]
              },
            )
            .toList();
    return MenuLocal(
      listOfItemCategoryMaps: listOfItemCategoryMapsTemp,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['listOfItemCategoryMaps'] = listOfItemCategoryMaps;

    return data;
  }

  @HiveField(0)
  List<Map<String, List<ItemDetails>>> listOfItemCategoryMaps;
}
