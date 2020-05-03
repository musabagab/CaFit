import 'package:provider_architecture/core/services/localstorage_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  var storageService = locator<LocalStorageService>();

  void start() {
    storageService.saveBoolToDisk(LocalStorageService.UserStartKey, true);
  }
}
