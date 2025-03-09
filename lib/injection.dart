import 'package:gecw_lakx/injection.config.dart'; // Ensure this import is correct
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance; // Corrected instantiation

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies(String env)=> getIt.init(environment: env);
