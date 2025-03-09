part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool isSubmitting,
    // required String role,
    required bool showErrorMessages,
    required Option<Either<AuthFailures, Unit>>
        authFailureOrSuccessOption, //option<None,some>
        required Option<Either<AuthFailures, String>> signInFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(input: ''),
        password: Password(input: ''),
        isSubmitting: false,
        signInFailureOrSuccessOption: none(),
        showErrorMessages: false,
        // role : '',
        authFailureOrSuccessOption: none(),
      );
}
