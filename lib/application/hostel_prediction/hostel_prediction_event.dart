part of 'hostel_prediction_bloc.dart';

@freezed
class HostelPredictionEvent with _$HostelPredictionEvent {
  const factory HostelPredictionEvent.hostelPredictionEventCalled({
    required String income,
    required String sgpa,
    required String district,
    required String category,
    required String gender,
    required String semester,
  }) = _hostelPredictionEventCalled;
}
