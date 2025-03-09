import 'package:dartz/dartz.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';

abstract class IHostelPrediction {

    Future<Either<FormFailures, Map<String, dynamic>>> predictHostelSelection({
    required String income,
    required String sgpa,
    required String district,
    required String category,
    required String gender,
    required String semester,
  });

}