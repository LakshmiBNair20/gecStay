import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';
import 'package:gecw_lakx/domain/hostel_process/i_hostel_process_facade.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

part 'approval_process_event.dart';
part 'approval_process_state.dart';
part 'approval_process_bloc.freezed.dart';


@injectable
class ApprovalProcessBloc extends Bloc<ApprovalProcessEvent, ApprovalProcessState> {
  final IHostelProcessFacade ihostelFacade;
  ApprovalProcessBloc(this.ihostelFacade) : super(ApprovalProcessState.initial()) {
    on<ApprovalProcessEvent>((event, emit) async{
      await event.map(approvalProcessPressed: (_approvalProcessPressed value) async{ 

        emit(state.copyWith(
          approvalSuccessOrFailure: none(),
          isSubmitting: true,
        ));

          final resp = await ihostelFacade.saveDataToDb(
            reason: '',
            rating: value.rating,
          hostelId: value.hostelId??'',
          hostelOwnerUserId: value.hostelOwnerUserId,
            isEdit: value.isEdit,
            hostelName: value.hostelName,
            ownerName: value.ownerName,
            phoneNumber: value.phoneNumber,
            rent: value.rent,
            rooms: value.rooms,
            location: value.location,
            // personsPerRoom: value.personsPerRoom,
            vacancy: value.vacancy,
            description: value.description,
            distFromCollege: value.distFromCollege,
            isMessAvailable: value.isMessAvailable,
            isMensHostel: value.isMensHostel,
            hostelImages: value.hostelImages,
            hostelIdForEdit: value.hostelId, approvalType: value.approvalType);


        resp.fold((f) {
          emit(state.copyWith(
            // successOrFailure: none(),
              
              isSubmitting: false,
              approvalSuccessOrFailure: some(left(f))));
        }, (s) {
          emit(state.copyWith(
            // successOrFailure: none(),
              isSubmitting: false,
              approvalSuccessOrFailure: some(right(s))));
        });
       }, rejectButtonPressedButton: (_rejectButtonPressedButton value) async{ 

        emit(state.copyWith(
          approvalSuccessOrFailure: none(),
          isSubmitting: true,
        ));

          final resp = await ihostelFacade.saveDataToDb(
            reason: value.reason,
            rating: value.rating,
          hostelId: value.hostelId??'',
          hostelOwnerUserId: value.hostelOwnerUserId,
            isEdit: value.isEdit,
            hostelName: value.hostelName,
            ownerName: value.ownerName,
            phoneNumber: value.phoneNumber,
            rent: value.rent,
            rooms: value.rooms,
            location: value.location,
            // personsPerRoom: value.personsPerRoom,
            vacancy: value.vacancy,
            description: value.description,
            distFromCollege: value.distFromCollege,
            isMessAvailable: value.isMessAvailable,
            isMensHostel: value.isMensHostel,
            hostelImages: value.hostelImages,
            hostelIdForEdit: value.hostelId, approvalType: value.approvalType);


        resp.fold((f) {
          emit(state.copyWith(
              isSubmitting: false,
              approvalSuccessOrFailure: some(left(f))));
        }, (s) {
          emit(state.copyWith(
              isSubmitting: false,
              approvalSuccessOrFailure: some(right(s))));
        });
        });
    });
  }
}
