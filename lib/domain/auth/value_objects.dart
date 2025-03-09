import 'package:dartz/dartz.dart';
import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';


class EmailAddress extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress({required String input}) {
    return EmailAddress._(validateEmailAddress(input));
  }
  const EmailAddress._(this.value);
}



class Password extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password({required String input}) {
    return Password._(validatePasswords(input));
  }

  const Password._(this.value);


}


