part of 'common_hostel_process_bloc.dart';

@freezed
class CommonHostelProcessEvent with _$CommonHostelProcessEvent {
  const factory CommonHostelProcessEvent.submitReviewButtonPressed({
    required String stars,
    required String userId,
    required String hostelOwnerUserId,
    required String userName,
    required String comment,
    required String hostelId,
  }) = _submitReviewButtonPressed;
  

  const factory CommonHostelProcessEvent.getAllratingsAndReview({
    required String hostelId,
  }) = _getAllratingsAndReview;

  const factory CommonHostelProcessEvent.deleteButtonPressed({required String hostelId, required String hostelOwnerUserId}) = _deleteButtonPressed;

  const factory CommonHostelProcessEvent.findLocationButtonPressed() =
      _findLocationButtonPressed;

      const factory CommonHostelProcessEvent.getHostelById({required String hostelId}) = _getHostelById;
      
  const factory CommonHostelProcessEvent.submitButtonPressed({
    required String approvalType,
    required String reason,
    required String hostelName,
     String? hostelId,
    required String ownerName,
    required String hostelOwnerUserId,
    required String phoneNumber,
    required String rent,
    required String rooms,
    required LatLng location,
    required bool isEdit,
    // required String personsPerRoom,
    required String vacancy,
    required String description,
    required String rating,
    required String distFromCollege,
    
    required String isMessAvailable,
required String isMensHostel, 
    required List<XFile> hostelImages,
  }) = _submitButtonPressed;
  

    const factory CommonHostelProcessEvent.getOwnersHostelList({required String userId}) = _getOwnersHostelList;
  const factory CommonHostelProcessEvent.getAllHostelList() = _getAllHostelList;
  const factory CommonHostelProcessEvent.getAdminHostelList({required String approvalType}) = _getAdminHostelList;
  
}