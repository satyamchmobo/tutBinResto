import 'package:hive/hive.dart';

import 'package:tutorbin/business_logic/models/menu_local_model.dart';
import 'package:tutorbin/services/local_database/database_service.dart';

class AppDatabaseServiceImpl extends DatabaseService {
  MenuLocal? menuLocal;
  @override
  Future<bool> saveMenuLocal({
    required MenuLocal menuLocal,
  }) async {
    final Box<MenuLocal> menuLocalBox = Hive.box<MenuLocal>('menuLocalBox');
    menuLocalBox.put('listOfItemCategoryMaps', menuLocal);
    return true;
  }

  @override
  MenuLocal? fetchUserProfile() {
    final Box<MenuLocal> menuLocalBox = Hive.box<MenuLocal>('menuLocalBox');
    menuLocal = menuLocalBox.get('listOfItemCategoryMaps');
    return menuLocal;
  }
}
