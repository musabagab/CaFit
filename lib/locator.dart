import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/localstorage_service.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/core/viewmodels/menu_model.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';

import 'core/services/navigation_service.dart';

GetIt locator = GetIt();

Future setupLocator() async {
  var instance = await LocalStorageService.getInstance();
  // register services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton<LocalStorageService>(instance);
  // register the viewmodel
  locator.registerFactory(() => OnboardingModel());
  locator.registerFactory(() => MenuModel());
  locator.registerFactory(() => InstructionsModel());
}
