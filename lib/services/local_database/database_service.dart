
import 'package:tutorbin/business_logic/models/menu_local_model.dart';

abstract class DatabaseService {
//   UserAuth? fetchUserCredentials();

// UserInfoModel? fetchUserProfile();

  Future<bool> saveMenuLocal({
    required MenuLocal menuLocal,
  });
MenuLocal? fetchUserProfile();

  // bool clearUserCred();

  // String? fetchHasProfileUpdated();

  // bool saveUserProfile({
  //   required UserInfoModel profile,
  // });

  // bool saveFcmToken(String fcmToken);
}
