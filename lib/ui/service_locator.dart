import 'package:get_it/get_it.dart';
import 'package:tutorbin/business_logic/view_models/menu_page_view_model.dart';
import 'package:tutorbin/services/local_database/database_service_impl.dart';

GetIt serviceLocator = GetIt.instance;
final databaseService = serviceLocator<AppDatabaseServiceImpl>();

void setupServiceLocator() {
  serviceLocator.registerFactory(() => MenuPageViewModel(null));
  serviceLocator.registerSingleton(AppDatabaseServiceImpl());
}
