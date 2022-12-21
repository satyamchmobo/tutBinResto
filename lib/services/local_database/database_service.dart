import 'package:tutorbin/business_logic/models/menu_local_model.dart';

abstract class DatabaseService {
  Future<bool> saveMenuLocal({
    required MenuLocal menuLocal,
  });
  MenuLocal? fetchUserProfile();
}
