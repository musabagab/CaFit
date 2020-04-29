import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/comments_model.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';

import 'core/services/api.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  // register services
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  // register the viewmodel
  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => OnboardingModel());
}
