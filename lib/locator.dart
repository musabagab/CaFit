import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/audio_service.dart';
import 'package:provider_architecture/core/services/exercies_service.dart';
import 'package:provider_architecture/core/services/localstorage_service.dart';
import 'package:provider_architecture/core/viewmodels/exercise_completed_viewmodel.dart';
import 'package:provider_architecture/core/viewmodels/instructions_model.dart';
import 'package:provider_architecture/core/viewmodels/menu_model.dart';
import 'package:provider_architecture/core/viewmodels/onboarding_model.dart';
import 'package:provider_architecture/core/viewmodels/startworkout_model.dart';
import 'package:provider_architecture/core/viewmodels/workout_model.dart';
import 'package:provider_architecture/core/viewmodels/rest_viewmodel.dart';

import 'core/services/navigation_service.dart';

GetIt locator = GetIt.asNewInstance();

Future setupLocator() async {
  var instance = await LocalStorageService.getInstance();
  // register services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AudioService());
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerLazySingleton(() => ExericesService());
  // register the viewmodel
  locator.registerFactory(() => OnboardingModel());
  locator.registerFactory(() => MenuModel());
  locator.registerFactory(() => InstructionsModel());
  locator.registerFactory(() => StartWorkoutModel());
  locator.registerFactory(() => WorkoutModel());
  locator.registerFactory(() => RestViewModel());
  locator.registerFactory(() => ExerciseCompletedViewModel());
}
