part of 'approval_process_bloc.dart';

@freezed
class ApprovalProcessState with _$ApprovalProcessState {
  const factory ApprovalProcessState({
    required bool isSubmitting,
    required Option<Either<FormFailures, Unit>> approvalSuccessOrFailure,
  }) = _ApprovalProcessState;

  factory ApprovalProcessState.initial() => ApprovalProcessState(
        isSubmitting: false,
        approvalSuccessOrFailure: none(),
      );
}
