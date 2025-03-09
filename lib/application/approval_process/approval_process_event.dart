part of 'approval_process_bloc.dart';

@freezed
class ApprovalProcessEvent with _$ApprovalProcessEvent {
   const factory ApprovalProcessEvent.approvalProcessPressed({
    required String approvalType,
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
  }) = _approvalProcessPressed;

const factory ApprovalProcessEvent.rejectButtonPressedButton({
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
  }) = _rejectButtonPressedButton;

}