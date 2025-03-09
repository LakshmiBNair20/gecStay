import 'package:freezed_annotation/freezed_annotation.dart';

 part 'auth_failures.freezed.dart';

@freezed
abstract class AuthFailures with _$AuthFailures{
  const factory AuthFailures.cancelledByUser() = _cancelledByUser;
  const factory AuthFailures.serverError() = _serverError;
  const factory AuthFailures.noInternetConnection() = _noInternetConnection;
  const factory AuthFailures.userNotFound() = _userNotFound;
  const factory AuthFailures.emailAlreadyInUse() = _emailAlreadyInUse;
  const factory AuthFailures.invalidEmailAndPasswordCombinationFailure() = _invalidEmailAndPasswordCombinationFailure;
  const factory AuthFailures.insufficientPermission() = _insufficientPermission;
  
}