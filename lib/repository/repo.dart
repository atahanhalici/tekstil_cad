import 'package:tekstil_cad/locator.dart';
import 'package:tekstil_cad/service/database_service.dart';

class Repository{
final DatabaseService _databaseService = locator<DatabaseService>();
  modelleriGetir() async{
 return await _databaseService.modelleriGetir();
  }

}