part of 'cart_listing_bloc.dart';

@freezed
class CartListingEvent with _$CartListingEvent {
    const factory CartListingEvent.loadBookingHistoryForStudent({
    required String userId,
  }) = _loadBookingHistoryForStudent;

    const factory CartListingEvent.loadBookingHistoryForOnwer({
    required String userId,
  }) = _loadBookingHistoryForOwner;

    const factory CartListingEvent.cancelBookingEvent({
    required String bookingId,
  }) = _CancelBookingEvent;
}