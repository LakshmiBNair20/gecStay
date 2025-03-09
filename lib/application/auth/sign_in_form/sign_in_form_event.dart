part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailAddressChangedEvent(String emailStr) = _emailAddressChangedEvent;
  const factory SignInFormEvent.passwordChangedEvent(String passwordStr) = _passwordChangedEvent;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed({
    required String role
  }) = _registerWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() = _signInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() = _signInWithGooglePressed;
  const factory SignInFormEvent.resetValues() = _resetValues;
  
}