import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/services/localstorage_service.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';

import 'core/services/api.dart';

GetIt locator = GetIt();

Future setupLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  // register services
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  // register the viewmodel
  locator.registerFactory(() => OnboardingModel());
}
