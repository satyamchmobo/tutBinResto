import 'package:flutter/cupertino.dart';
import 'package:tutorbin/business_logic/models/item_details_model.dart';
import 'package:tutorbin/business_logic/models/menu_local_model.dart';
import 'package:tutorbin/business_logic/view_models/base_view_model.dart';
import 'package:tutorbin/ui/service_locator.dart';
import 'package:tutorbin/ui/widgets/snackbar.dart';
import 'package:tutorbin/utils/constants/enums.dart';

class MenuPageViewModel extends BaseModel {
  MenuPageViewModel(initialState) : super(initialState);

  late List<Map<String, List<ItemDetails>>> listOfItemCategoryMaps;
  late List<Map<String, int>> listOfMapOfIndexesToUpdateLocal;
  late MenuLocal? menuLocal;
  List<ItemDetailsWithIndexes?> popularItems = [];
  double total = 0;

  void pickNonZeroTimesOrderedItems() {
    for (int i = 0; i < menuLocal!.listOfItemCategoryMaps.length; i++) {
      Map<String, List<ItemDetails>> map = menuLocal!.listOfItemCategoryMaps[i];

      for (int j = 0; j < map.values.first.length; j++) {
        if ((menuLocal
                    ?.listOfItemCategoryMaps[i].values.first[j].orderedCount ??
                0) >
            0) {
          popularItems.add(ItemDetailsWithIndexes(
              catListIndex: i,
              itemListIndex: j,
              instock:
                  menuLocal?.listOfItemCategoryMaps[i].values.first[j].instock,
              isBestseller: menuLocal
                  ?.listOfItemCategoryMaps[i].values.first[j].isBestseller,
              name: menuLocal?.listOfItemCategoryMaps[i].values.first[j].name,
              orderedCount: menuLocal
                  ?.listOfItemCategoryMaps[i].values.first[j].orderedCount,
              price:
                  menuLocal?.listOfItemCategoryMaps[i].values.first[j].price));

        }
      }

      popularItems
          .sort(((a, b) => b!.orderedCount!.compareTo(a!.orderedCount as num)));
      if (popularItems.length > 3) {
        List<ItemDetailsWithIndexes?> tempList = popularItems;
        popularItems = [];
        for (int i = 0; i < 3; i++) {
          popularItems.add(tempList[i]);
        }
      }
    }
  }

  void init() async {
    popularItems = [];
    setState(ViewState.busy);

    menuLocal = databaseService.fetchUserProfile();
    if (menuLocal == null) {
      await databaseService.saveMenuLocal(
        menuLocal: MenuLocal.fromJson(
          menuDataMap,
        ),
      );
      menuLocal = databaseService.fetchUserProfile();
    } else {
      pickNonZeroTimesOrderedItems();
    }

    listOfItemCategoryMaps = (menuDataMap)
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
    debugPrint(listOfItemCategoryMaps.length.toString());

    emit(listOfItemCategoryMaps);
    setState(ViewState.idle);
  }

  void placeOrder(BuildContext context) {
    setState(ViewState.busy);

    for (int i = 0; i < listOfItemCategoryMaps.length; i++) {
      Map<String, List<ItemDetails>> map = listOfItemCategoryMaps[i];

      for (int j = 0; j < map.values.first.length; j++) {
        menuLocal?.listOfItemCategoryMaps[i].values.first[j].orderedCount =
            (menuLocal?.listOfItemCategoryMaps[i].values.first[j]
                        .orderedCount ??
                    0) +
                (listOfItemCategoryMaps[i].values.first[j].orderedCount ?? 0);
        listOfItemCategoryMaps[i].values.first[j].orderedCount = 0;
      }
    }

    databaseService.saveMenuLocal(menuLocal: menuLocal!);
    debugPrint(databaseService
        .fetchUserProfile()
        ?.listOfItemCategoryMaps[0]
        .values
        .first[0]
        .orderedCount
        .toString());

    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(ViewState.idle);
      showSnackBar(context, 'Order placed, Place a new order now !',
          duration: const Duration(seconds: 3));
    });
    total = 0;
  }

  void incrementCountOfItem(int catListIndex, int itemListIndex) {
    setState(ViewState.busy);

    if ((listOfItemCategoryMaps[catListIndex]
                .values
                .first[itemListIndex]
                .orderedCount ??
            0) <
        1000) {
      listOfItemCategoryMaps[catListIndex]
          .values
          .first[itemListIndex]
          .orderedCount = (listOfItemCategoryMaps[catListIndex]
                  .values
                  .first[itemListIndex]
                  .orderedCount ??
              0) +
          1;
    }
    debugPrint(listOfItemCategoryMaps[catListIndex]
        .values
        .first[itemListIndex]
        .orderedCount
        .toString());

    total += listOfItemCategoryMaps[catListIndex]
            .values
            .first[itemListIndex]
            .price ??
        0;

    setState(ViewState.idle);
    emit(total);

    emit(listOfItemCategoryMaps);
  }

  void decrementCountOfItem(int catListIndex, int itemListIndex) {
    setState(ViewState.busy);
    if ((listOfItemCategoryMaps[catListIndex]
                .values
                .first[itemListIndex]
                .orderedCount ??
            0) >
        0) {
      listOfItemCategoryMaps[catListIndex]
          .values
          .first[itemListIndex]
          .orderedCount = (listOfItemCategoryMaps[catListIndex]
                  .values
                  .first[itemListIndex]
                  .orderedCount ??
              0) -
          1;
    }
    debugPrint(listOfItemCategoryMaps[catListIndex]
        .values
        .first[itemListIndex]
        .orderedCount
        .toString());

    total -= listOfItemCategoryMaps[catListIndex]
            .values
            .first[itemListIndex]
            .price ??
        0;
    setState(ViewState.idle);
    emit(total);
    emit(listOfItemCategoryMaps);
  }
}

var menuDataMap = {
  "cat1": [
    {"name": "XYZ", "price": 100, "instock": true},
    {"name": "ABC", "price": 934, "instock": false},
    {"name": "OTR", "price": 945, "instock": true},
    {"name": "SLG", "price": 343, "instock": true},
    {"name": "KGN", "price": 342, "instock": true},
    {"name": "GDS", "price": 234, "instock": true},
    {"name": "KNL", "price": 934, "instock": true},
    {"name": "GLM", "price": 320, "instock": true},
    {"name": "DKF", "price": 394, "instock": false},
    {"name": "VFS", "price": 854, "instock": true}
  ],
  "cat2": [
    {"name": "NA", "price": 124, "instock": true},
    {"name": "DS", "price": 953, "instock": true},
    {"name": "HF", "price": 100, "instock": true},
    {"name": "FJ", "price": 583, "instock": true},
    {"name": "LS", "price": 945, "instock": false},
    {"name": "TR", "price": 394, "instock": true},
    {"name": "PD", "price": 35, "instock": true},
    {"name": "AL", "price": 125, "instock": true},
    {"name": "TK", "price": 129, "instock": true},
    {"name": "PG", "price": 294, "instock": true}
  ],
  "cat3": [
    {"name": "A", "price": 294, "instock": true},
    {"name": "B", "price": 125, "instock": true},
    {"name": "C", "price": 256, "instock": true},
    {"name": "D", "price": 100, "instock": true},
    {"name": "E", "price": 100, "instock": true},
    {"name": "F", "price": 530, "instock": true},
    {"name": "G", "price": 100, "instock": true},
    {"name": "H", "price": 100, "instock": true},
    {"name": "I", "price": 395, "instock": true}
  ],
  "cat4": [
    {"name": "J", "price": 100, "instock": true},
    {"name": "K", "price": 100, "instock": true},
    {"name": "L", "price": 125, "instock": false},
    {"name": "M", "price": 530, "instock": true},
    {"name": "N", "price": 100, "instock": true},
    {"name": "O", "price": 395, "instock": true},
    {"name": "P", "price": 100, "instock": true},
    {"name": "Q", "price": 400, "instock": true},
    {"name": "R", "price": 100, "instock": true},
    {"name": "S", "price": 256, "instock": true}
  ],
  "cat5": [
    {"name": "T", "price": 100, "instock": false},
    {"name": "U", "price": 100, "instock": true},
    {"name": "V", "price": 395, "instock": true},
    {"name": "W", "price": 100, "instock": true},
    {"name": "X", "price": 100, "instock": false},
    {"name": "Y", "price": 125, "instock": true},
    {"name": "Z", "price": 530, "instock": true}
  ],
  "cat6": [
    {"name": "ABCD", "price": 400, "instock": true},
    {"name": "PROS", "price": 256, "instock": true},
    {"name": "NFDD", "price": 200, "instock": true},
    {"name": "LFKR", "price": 200, "instock": true}
  ]
};

class ItemDetailsWithIndexes {
  ItemDetailsWithIndexes(
      {this.name,
      this.price,
      this.instock,
      this.isBestseller,
      this.catListIndex,
      this.itemListIndex,
      this.orderedCount});

  factory ItemDetailsWithIndexes.fromJson(Map<String, dynamic> json) {
    return ItemDetailsWithIndexes(
      name: json['name'] as String,
      price: json['price'] as int,
      instock: json['instock'] as bool,
      isBestseller: json['isBestseller'] ?? false,
      orderedCount: json['orderedCount'] ?? 0,
      catListIndex: json['catListIndex'] ?? 0,
      itemListIndex: json['itemListIndex'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name as String;
    data['price'] = price as int;
    data['instock'] = instock as bool;
    data['isBestseller'] = isBestseller as bool;
    data['catListIndex'] = catListIndex as int;
    data['itemListIndex'] = itemListIndex as int;

    return data;
  }

  String? name;
  int? price;
  int? catListIndex;
  int? itemListIndex;

  bool? instock;
  bool? isBestseller;
  int? orderedCount;
}
