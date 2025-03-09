import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';
import 'package:gecw_lakx/domain/hostel_prediction/i_hostel_prediction.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHostelPrediction)
class HostelPredictionImpl extends IHostelPrediction {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://ml-predictor-0sly.onrender.com/predict';

  @override
  Future<Either<FormFailures, Map<String, dynamic>>> predictHostelSelection({
    required String income,
    required String sgpa,
    required String district,
    required String category,
    required String gender,
    required String semester,
  }) async {
    try {
      debugPrint("$income, $sgpa, $district, $category, $gender, $semester");
      final response = await _dio.post(
        _baseUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "income": double.tryParse(income) ?? 0.0,
          "sgpa": double.tryParse(sgpa) ?? 0.0,
          "keam_rank": double.tryParse(sgpa) ?? 0.0,
          "district": district,
          "category": category,
          "gender": gender.toLowerCase(),
          "semester": semester,
        },
      );
      debugPrint("success ");

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return Right(response.data);
      } else {
        debugPrint("else working in api");
        return Left(FormFailures.serviceUnavailable());
      }
    } catch (e) {
      print("ithan error");
      return Left(FormFailures.serverError());
    }
  }
}
