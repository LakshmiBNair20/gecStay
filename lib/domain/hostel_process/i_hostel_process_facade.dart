import 'package:dartz/dartz.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../core/location_fetch_failures.dart';

abstract class IHostelProcessFacade {
  Future<Either<LocationFetchFailures, LatLng>> getCurrentLocation();
  Future<Either<FormFailures, Unit>> saveDataToDb(
      {required bool isEdit,
      required String approvalType,
      required String reason,
      String? hostelIdForEdit,
      required String hostelName,
      required String ownerName,
      required String rating,
      required String hostelId,
      required String hostelOwnerUserId,
      required String phoneNumber,
      required String rent,
      required String distFromCollege,
      required String isMessAvailable,
      required String isMensHostel,
      required String rooms,
      required LatLng location,
      required String vacancy,
      required String description,
      required List<XFile> hostelImages});
  Future<Either<FormFailures, List<HostelResponseModel>>> getOwnerHostelList(
      {required String userId});

  Future<Either<FormFailures, List<HostelResponseModel>>> getAllHostelList();
  Future<Either<FormFailures, List<HostelResponseModel>>> getAdminHostelList(
      {required String aprovalType});
  Future<Either<FormFailures, HostelResponseModel>> getHostelById(
      {required String hostelId});

  Future<Either<FormFailures, Unit>> rateTheHostel({
    required String hostelId,
    required String hostelOwnerUserId,
    required String star,
    required String comment,
    required String userId,
    required String userName,
  });

  Future<void> ratingAvgCalculation(
      {required String hostelId, required String hostelOwnerUserId});

  Future<Either<FormFailures, List<Map<String, String>>>>
      getAllratingsAndReview({
    required String hostelId,
  });

  Future<Either<FormFailures, List<String>>> uploadHostelImages({
    required List<XFile> hostelImages,
  });

  Future<Either<Exception, Unit>> deleteHostel({
    required String hostelId,
    required String hostelOwnerUserId,
  });

  Future<Either<FormFailures, Unit>> addRoomsToFirestore({
    required Map<String, dynamic> roomData,
    required String hostelId,
  });

  Future<Either<FormFailures, List<Map<String, dynamic>>>>
      getRoomsFromFirestore({
    required String hostelId,
  });

  Future<Either<FormFailures, Unit>> bookRoomsInFirestore({
    required String userId,
    required String hostelName,
    required String hostelOwnerUserId,
    required String hostelId,
    required List<Map<String, dynamic>> selectedRooms,
    required String userName,
    required String userPhone,
  });

  Future<Either<FormFailures, List<Map<String, dynamic>>>>
      getBookingsFromFirestore({
    String? studentUserId,
    String? hostelOwnerUserId,
  });

  Future<Either<FormFailures, Unit>> cancelBooking({
    required String bookingId,
  });

  Future<Either<FormFailures, Unit>> editRoomInFirestore({
    required String hostelId,
    required Map<String, dynamic> updatedRoom,
  });

  Future<void> updateRoomVacancy({
    required bool isBooking,
    required String hostelId,
    required String roomNumber,
    required int bookedBeds,
  });

    Future<Either<FormFailures, Unit>> updateRoomVacancyByOwner({
    required String hostelId,
    required String roomNumber,
    required int updatedVacancy,
     required String totalBeds,
  });
}
