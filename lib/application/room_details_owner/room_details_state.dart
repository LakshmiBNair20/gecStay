part of 'room_details_bloc.dart';

@freezed
class RoomDetailsState with _$RoomDetailsState {
  factory RoomDetailsState({
    required bool isSubmitting,
    required String processingBookingId,
    required Option<Either<FormFailures, Unit>> successOrFailureOption,
    required Option<Either<FormFailures, List<Map<String, dynamic>>>> fetchSuccessOrFailureOption,
  }) = _RoomDetailsState;

  factory RoomDetailsState.initial() => RoomDetailsState(
        isSubmitting: false,
        processingBookingId: '',
        successOrFailureOption: none(),
        fetchSuccessOrFailureOption: none(),
      );
}
