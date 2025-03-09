import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failures.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
          emailAddressChangedEvent: (value) {
            emit(state.copyWith(
              signInFailureOrSuccessOption:none(),
                emailAddress: EmailAddress(input: value.emailStr),
                authFailureOrSuccessOption: none()));
          },
          passwordChangedEvent: (value) {
            emit(state.copyWith(
              signInFailureOrSuccessOption:none(),
                authFailureOrSuccessOption: none(),
                password: Password(input: value.passwordStr)));
          },
          registerWithEmailAndPasswordPressed: (value) async {
            Either<AuthFailures, Unit>? authFailureOrSuccess;
            final isEmailValid = state.emailAddress.isValid();
            final isPasswordValid = state.password.isValid();

            if (isEmailValid && isPasswordValid) {
              emit(state.copyWith(
                signInFailureOrSuccessOption:none(),
                isSubmitting: true,
                authFailureOrSuccessOption: none(),
              ));

              authFailureOrSuccess =
                  await _authFacade.registerWithEmailAndPassword(
                      emailAddress: state.emailAddress,
                      role: value.role,
                      password: state.password);
            }

            emit(state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              signInFailureOrSuccessOption:none(),
              authFailureOrSuccessOption: optionOf(authFailureOrSuccess),
            ));
          },
          signInWithEmailAndPasswordPressed: (value) async {
            Either<AuthFailures, Unit>? authFailureOrSuccess;
           Either<AuthFailures, String>? signInFailureOrSuccessOption;
            final isEmailValid = state.emailAddress.isValid();
            final isPasswordValid = state.password.isValid();

            if (isEmailValid && isPasswordValid) {
              emit(state.copyWith(
                signInFailureOrSuccessOption:none(),
                isSubmitting: true,
                authFailureOrSuccessOption: none(),
              ));

              signInFailureOrSuccessOption =
                  await _authFacade.signInWithEmailAndPassword(
                      emailAddress: state.emailAddress,
                      password: state.password);
            }
            emit(state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              signInFailureOrSuccessOption: optionOf(signInFailureOrSuccessOption),
              authFailureOrSuccessOption: optionOf(authFailureOrSuccess),
            ));
          },
          signInWithGooglePressed: (value) {},
          resetValues: ( value) {
            emit(state.copyWith(
              isSubmitting: false,
              signInFailureOrSuccessOption:none(),
              authFailureOrSuccessOption: none()
            ));
          });
    });
  }
}
