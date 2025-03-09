part of 'hostel_prediction_bloc.dart';

@freezed
class HostelPredictionState with _$HostelPredictionState {
  factory HostelPredictionState({
    required bool isSubmitting,
    required Option<Either<FormFailures, Map<String, dynamic>>> successOrFailureOption,
  }) = _HostelPredictionState;

  factory HostelPredictionState.initial() => HostelPredictionState(
        isSubmitting: false,
        successOrFailureOption: none()
      );
}
