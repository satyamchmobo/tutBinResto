import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tutorbin/business_logic/models/item_details_model.dart';
import 'package:tutorbin/business_logic/models/menu_local_model.dart';
import 'package:tutorbin/ui/menu_page.dart';
import 'package:tutorbin/ui/service_locator.dart';

import 'package:tutorbin/utils/constants/app_colors.dart';
import 'package:tutorbin/utils/constants/app_text.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  final Directory dir = await path.getApplicationSupportDirectory();

  Hive
    ..init(dir.path)
    ..registerAdapter(MenuLocalAdapter())
    ..registerAdapter(ItemDetailsAdapter());
  await Hive.openBox<MenuLocal>('menuLocalBox');
  
    // await databaseService.saveMenuLocal(
    //   menuLocal: MenuLocal.fromJson(
    //     menuDataMap,
    //   ),
    // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColorSwatchOrange,
      ),
      home: const MenuPage(title: menuScreenTitle),
    );
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
