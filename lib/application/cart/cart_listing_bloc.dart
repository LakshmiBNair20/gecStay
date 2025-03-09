import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';
import 'package:gecw_lakx/domain/hostel_process/i_hostel_process_facade.dart';
import 'package:injectable/injectable.dart';

part 'cart_listing_event.dart';
part 'cart_listing_state.dart';
part 'cart_listing_bloc.freezed.dart';

@injectable
class CartListingBloc extends Bloc<CartListingEvent, CartListingState> {
  final IHostelProcessFacade ihostelFacade;
  CartListingBloc(this.ihostelFacade) : super(CartListingState.initial()) {
    on<CartListingEvent>((event, emit) async {
      await event.map(
        loadBookingHistoryForStudent:
            (_loadBookingHistoryForStudent value) async {
          emit(state.copyWith(
            isSubmitting: true,
            fetchSuccessOrFailureOption: none(),
          ));
          final resp = await ihostelFacade.getBookingsFromFirestore(
              studentUserId: value.userId);

          resp.fold((f) {
            emit(state.copyWith(
              isSubmitting: false,
              fetchSuccessOrFailureOption: some(left(f)),
            ));
          }, (s) {
            emit(state.copyWith(
              isSubmitting: false,
              fetchSuccessOrFailureOption: some(right(s)),
            ));
          });
        },
        loadBookingHistoryForOnwer: (_loadBookingHistoryForOwner value) async {
          emit(state.copyWith(
            isSubmitting: true,
            fetchSuccessOrFailureOption: none(),
          ));
          final resp = await ihostelFacade.getBookingsFromFirestore(
              hostelOwnerUserId: value.userId);

          resp.fold((f) {
            emit(state.copyWith(
              isSubmitting: false,
              fetchSuccessOrFailureOption: some(left(f)),
            ));
          }, (s) {
            emit(state.copyWith(
              isSubmitting: false,
              fetchSuccessOrFailureOption: some(right(s)),
            ));
          });
        },
        cancelBookingEvent: (_CancelBookingEvent value) async {
          emit(state.copyWith(
            isCancelling: true,
            processingBookingId: value.bookingId,
            successOrFailureOption: none(),
            // fetchSuccessOrFailureOption: none(),
          ));
          final resp =
              await ihostelFacade.cancelBooking(bookingId: value.bookingId);

          resp.fold((f) {
            emit(state.copyWith(
              isCancelling: false,
              // fetchSuccessOrFailureOption:none(),
              successOrFailureOption: some(left(f)),
            ));
          }, (s) {
            emit(state.copyWith(
              isCancelling: false,
              successOrFailureOption: some(right(s)),
            ));
          });
        },
      );
    });
  }
}
