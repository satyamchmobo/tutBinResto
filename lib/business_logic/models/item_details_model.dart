import 'package:hive/hive.dart';
part 'item_details_model.g.dart';

@HiveType(typeId: 0)
class ItemDetails {
  ItemDetails(
      {this.name,
      this.price,
      this.instock,
      this.isBestseller,
      this.orderedCount});

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
        name: json['name'] as String,
        price: json['price'] as int,
        instock: json['instock'] as bool,
        isBestseller: json['isBestseller']  ??false,
        orderedCount: json['orderedCount'] ??0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name as String;
    data['price'] = price as int;
    data['instock'] = instock as bool;
    data['isBestseller'] = isBestseller as bool;
    data['orderedCount'] = orderedCount as int;
    return data;
  }

  @HiveField(0)
  String? name;
  @HiveField(1)
  int? price;
  @HiveField(2)
  bool? instock;
  @HiveField(3)
  bool? isBestseller;
  @HiveField(4)
  int? orderedCount;
}
