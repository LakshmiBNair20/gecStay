import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/cart/cart_listing_bloc.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';

class CartScreenStudentApp extends StatefulWidget {
  const CartScreenStudentApp({super.key});

  @override
  State<CartScreenStudentApp> createState() => _CartScreenStudentAppState();
}

class _CartScreenStudentAppState extends State<CartScreenStudentApp> {
  String? cancellingBookingId; // Tracks which booking is being canceled
  List<dynamic> bookings = []; // Holds the list of bookings

  void _showCancelConfirmation(BuildContext context, String bookingId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cancel Booking"),
          content: const Text("Are you sure you want to cancel this booking?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                setState(() {
                  cancellingBookingId = bookingId;
                });
                debugPrint("$cancellingBookingId == $bookingId");
                context.read<CartListingBloc>().add(
                      CartListingEvent.cancelBookingEvent(bookingId: bookingId),
                    );
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: BlocConsumer<CartListingBloc, CartListingState>(
        listener: (context, state) {
          if (!state.isCancelling) {
            setState(() {
              cancellingBookingId = null; // Reset after cancellation
            });
          } else {
            setState(() {
              cancellingBookingId =
                  state.processingBookingId; // Track cancellation
            });
          }

          // Handle booking cancellation response
          state.successOrFailureOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                // Handle failure (e.g., show a snackbar)
              },
              (success) {
                setState(() {
                  // Update only the cancelled booking's status
                  int index = bookings.indexWhere((booking) =>
                      booking['bookingId'] == state.processingBookingId);
                  if (index != -1) {
                    bookings[index]['status'] = 'cancelled';
                  }
                });

                // Fetch updated bookings list from API
                // context.read<CartListingBloc>().add(const CartListingEvent.loadBookingHistoryForStudent());
              },
            ),
          );

          // Handle fetch success (full refresh)
          state.fetchSuccessOrFailureOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                // Handle failure case
              },
              (success) {
                setState(() {
                  bookings = success; // Update full list
                });
              },
            ),
          );
        },
        builder: (context, state) {
          return state.isSubmitting
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                )
              : bookings.isEmpty
                  ? Center(
                      child: Text(
                        "NO BOOKINGS...",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: bookings.isNotEmpty ? bookings.length : 0,
                        itemBuilder: (context, index) {
                          final hostel = bookings[index];
                          final String status =
                              (hostel['status'] ?? 'unknown').toString();
                          final String bookingId =
                              (hostel['bookingId'] ?? '').toString();

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      hostel['hostelName'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        debugPrint(
                                            "$cancellingBookingId == $bookingId");
                                        if (status == 'booked' &&
                                            cancellingBookingId == null) {
                                          _showCancelConfirmation(
                                              context, bookingId);
                                        }
                                      },
                                      child: (cancellingBookingId ==
                                                  bookingId &&
                                              state.isCancelling)
                                          ? const SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                color: Colors.deepPurpleAccent,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : Text(
                                              status.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: status == 'booked'
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Rooms:',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Column(
                                  children: (hostel['rooms'] as List)
                                      .map<Widget>((room) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.bed,
                                              size: 16, color: Colors.white70),
                                          const SizedBox(width: 6),
                                          Text(
                                            'Room ${room['roomNumber'] ?? 'N/A'} - Beds: ${room['selectedBedsCount'] ?? 0}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          );
                        },
                      ),
                    );
        },
      ),
    );
  }

  String _mapFailureToMessage(FormFailures failure) {
    return failure.maybeMap(
      serverError: (_) => "Server error, please try again",
      noDataFound: (_) => "No bookings available",
      orElse: () => "Something went wrong",
    );
  }
}
