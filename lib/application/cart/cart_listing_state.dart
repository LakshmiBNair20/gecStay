part of 'cart_listing_bloc.dart';

@freezed
class CartListingState with _$CartListingState {
  factory CartListingState({
    required bool isSubmitting,
    required bool isCancelling,
    required Option<Either<FormFailures, List<Map<String, dynamic>>>>
        fetchSuccessOrFailureOption,
        required String processingBookingId,
    required Option<Either<FormFailures, Unit>> successOrFailureOption,
  }) = _CartListingState;

  factory CartListingState.initial() => CartListingState(
        isSubmitting: false,
        fetchSuccessOrFailureOption: none(),
        successOrFailureOption: none(),
        processingBookingId: '',
        isCancelling: false
      );
}
