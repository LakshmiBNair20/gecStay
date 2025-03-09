
import 'package:gecw_lakx/domain/core/failures.dart';

class UnexpectedValueError extends Error{
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a Value Failure at unrecoverble point. Terminating';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }

}