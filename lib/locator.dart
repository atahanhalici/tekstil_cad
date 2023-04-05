import 'package:get_it/get_it.dart';
import 'package:tekstil_cad/repository/repo.dart';
import 'package:tekstil_cad/service/database_service.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => Repository());
   locator.registerLazySingleton(() => DatabaseService());
}