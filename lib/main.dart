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
