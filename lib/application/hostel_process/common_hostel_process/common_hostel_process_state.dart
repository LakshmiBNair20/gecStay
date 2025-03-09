part of 'common_hostel_process_bloc.dart';

@freezed
class CommonHostelProcessState with _$CommonHostelProcessState {
  factory CommonHostelProcessState({
    required bool isSubmitting,
    required Option<Either<FormFailures, Unit>> successOrFailure,
    required Option<Either<FormFailures, List<Map<String, String>>>>
        getAllRatingsSuccessOrFailure,
    required List<Map<String, String>> respList,
    required LatLng location,
    required bool showErrorMessages,
    required Option<Either<FormFailures, Unit>> submitFailureOrSuccessOption,
    required Option<Either<LocationFetchFailures, LatLng>> locationOption,
    required HostelResponseModel hostelDataById,
    // required bool isSubmitting,
    required bool locationFetched,
    required List<HostelResponseModel> hostelData,
    required Option<Either<FormFailures,List<HostelResponseModel>>> hostelGetFailureOrSuccess,
   
  }) = _CommonHostelProcessState;

  factory CommonHostelProcessState.initial() => CommonHostelProcessState(
      isSubmitting: false,
      successOrFailure: none(),
      hostelGetFailureOrSuccess: none(),
      getAllRatingsSuccessOrFailure: none(),
      
      respList: [],
      hostelData: [],
      hostelDataById: HostelResponseModel(
        description: '',
        hostelName: '',
        location: Location(latitude: 0, longitude: 0),
        hostelId: '',
        ownerName: '',
        distFromCollege: '',
        isMessAvailable: '',
        isMensHostel: '',
        phoneNumber: '',
        rent: '',
        rooms: '',
        vacancy: '',
        hostelImages: [],
        hostelOwnerUserId: '',
        rating: '',
        approval: Approval(reason: '', type: '')
      ),
      submitFailureOrSuccessOption: none(),
      locationOption: none(),
      locationFetched: false,
      showErrorMessages: false,
      location: LatLng(0, 0));
}
