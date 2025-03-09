// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res, SignInFormEvent>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res, $Val extends SignInFormEvent>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$emailAddressChangedEventImplCopyWith<$Res> {
  factory _$$emailAddressChangedEventImplCopyWith(
          _$emailAddressChangedEventImpl value,
          $Res Function(_$emailAddressChangedEventImpl) then) =
      __$$emailAddressChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String emailStr});
}

/// @nodoc
class __$$emailAddressChangedEventImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$emailAddressChangedEventImpl>
    implements _$$emailAddressChangedEventImplCopyWith<$Res> {
  __$$emailAddressChangedEventImplCopyWithImpl(
      _$emailAddressChangedEventImpl _value,
      $Res Function(_$emailAddressChangedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailStr = null,
  }) {
    return _then(_$emailAddressChangedEventImpl(
      null == emailStr
          ? _value.emailStr
          : emailStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$emailAddressChangedEventImpl implements _emailAddressChangedEvent {
  const _$emailAddressChangedEventImpl(this.emailStr);

  @override
  final String emailStr;

  @override
  String toString() {
    return 'SignInFormEvent.emailAddressChangedEvent(emailStr: $emailStr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$emailAddressChangedEventImpl &&
            (identical(other.emailStr, emailStr) ||
                other.emailStr == emailStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailStr);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$emailAddressChangedEventImplCopyWith<_$emailAddressChangedEventImpl>
      get copyWith => __$$emailAddressChangedEventImplCopyWithImpl<
          _$emailAddressChangedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) {
    return emailAddressChangedEvent(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) {
    return emailAddressChangedEvent?.call(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) {
    if (emailAddressChangedEvent != null) {
      return emailAddressChangedEvent(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) {
    return emailAddressChangedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) {
    return emailAddressChangedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) {
    if (emailAddressChangedEvent != null) {
      return emailAddressChangedEvent(this);
    }
    return orElse();
  }
}

abstract class _emailAddressChangedEvent implements SignInFormEvent {
  const factory _emailAddressChangedEvent(final String emailStr) =
      _$emailAddressChangedEventImpl;

  String get emailStr;

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$emailAddressChangedEventImplCopyWith<_$emailAddressChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$passwordChangedEventImplCopyWith<$Res> {
  factory _$$passwordChangedEventImplCopyWith(_$passwordChangedEventImpl value,
          $Res Function(_$passwordChangedEventImpl) then) =
      __$$passwordChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String passwordStr});
}

/// @nodoc
class __$$passwordChangedEventImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$passwordChangedEventImpl>
    implements _$$passwordChangedEventImplCopyWith<$Res> {
  __$$passwordChangedEventImplCopyWithImpl(_$passwordChangedEventImpl _value,
      $Res Function(_$passwordChangedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwordStr = null,
  }) {
    return _then(_$passwordChangedEventImpl(
      null == passwordStr
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$passwordChangedEventImpl implements _passwordChangedEvent {
  const _$passwordChangedEventImpl(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChangedEvent(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$passwordChangedEventImpl &&
            (identical(other.passwordStr, passwordStr) ||
                other.passwordStr == passwordStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passwordStr);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$passwordChangedEventImplCopyWith<_$passwordChangedEventImpl>
      get copyWith =>
          __$$passwordChangedEventImplCopyWithImpl<_$passwordChangedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) {
    return passwordChangedEvent(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) {
    return passwordChangedEvent?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) {
    if (passwordChangedEvent != null) {
      return passwordChangedEvent(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) {
    return passwordChangedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) {
    return passwordChangedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) {
    if (passwordChangedEvent != null) {
      return passwordChangedEvent(this);
    }
    return orElse();
  }
}

abstract class _passwordChangedEvent implements SignInFormEvent {
  const factory _passwordChangedEvent(final String passwordStr) =
      _$passwordChangedEventImpl;

  String get passwordStr;

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$passwordChangedEventImplCopyWith<_$passwordChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$registerWithEmailAndPasswordPressedImplCopyWith<$Res> {
  factory _$$registerWithEmailAndPasswordPressedImplCopyWith(
          _$registerWithEmailAndPasswordPressedImpl value,
          $Res Function(_$registerWithEmailAndPasswordPressedImpl) then) =
      __$$registerWithEmailAndPasswordPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String role});
}

/// @nodoc
class __$$registerWithEmailAndPasswordPressedImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res,
        _$registerWithEmailAndPasswordPressedImpl>
    implements _$$registerWithEmailAndPasswordPressedImplCopyWith<$Res> {
  __$$registerWithEmailAndPasswordPressedImplCopyWithImpl(
      _$registerWithEmailAndPasswordPressedImpl _value,
      $Res Function(_$registerWithEmailAndPasswordPressedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
  }) {
    return _then(_$registerWithEmailAndPasswordPressedImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$registerWithEmailAndPasswordPressedImpl
    implements _registerWithEmailAndPasswordPressed {
  const _$registerWithEmailAndPasswordPressedImpl({required this.role});

  @override
  final String role;

  @override
  String toString() {
    return 'SignInFormEvent.registerWithEmailAndPasswordPressed(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$registerWithEmailAndPasswordPressedImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$registerWithEmailAndPasswordPressedImplCopyWith<
          _$registerWithEmailAndPasswordPressedImpl>
      get copyWith => __$$registerWithEmailAndPasswordPressedImplCopyWithImpl<
          _$registerWithEmailAndPasswordPressedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) {
    return registerWithEmailAndPasswordPressed(role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) {
    return registerWithEmailAndPasswordPressed?.call(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) {
    return registerWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) {
    return registerWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _registerWithEmailAndPasswordPressed implements SignInFormEvent {
  const factory _registerWithEmailAndPasswordPressed(
      {required final String role}) = _$registerWithEmailAndPasswordPressedImpl;

  String get role;

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$registerWithEmailAndPasswordPressedImplCopyWith<
          _$registerWithEmailAndPasswordPressedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$signInWithEmailAndPasswordPressedImplCopyWith<$Res> {
  factory _$$signInWithEmailAndPasswordPressedImplCopyWith(
          _$signInWithEmailAndPasswordPressedImpl value,
          $Res Function(_$signInWithEmailAndPasswordPressedImpl) then) =
      __$$signInWithEmailAndPasswordPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$signInWithEmailAndPasswordPressedImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res,
        _$signInWithEmailAndPasswordPressedImpl>
    implements _$$signInWithEmailAndPasswordPressedImplCopyWith<$Res> {
  __$$signInWithEmailAndPasswordPressedImplCopyWithImpl(
      _$signInWithEmailAndPasswordPressedImpl _value,
      $Res Function(_$signInWithEmailAndPasswordPressedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$signInWithEmailAndPasswordPressedImpl
    implements _signInWithEmailAndPasswordPressed {
  const _$signInWithEmailAndPasswordPressedImpl();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$signInWithEmailAndPasswordPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) {
    return signInWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) {
    return signInWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) {
    return signInWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) {
    return signInWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _signInWithEmailAndPasswordPressed implements SignInFormEvent {
  const factory _signInWithEmailAndPasswordPressed() =
      _$signInWithEmailAndPasswordPressedImpl;
}

/// @nodoc
abstract class _$$signInWithGooglePressedImplCopyWith<$Res> {
  factory _$$signInWithGooglePressedImplCopyWith(
          _$signInWithGooglePressedImpl value,
          $Res Function(_$signInWithGooglePressedImpl) then) =
      __$$signInWithGooglePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$signInWithGooglePressedImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$signInWithGooglePressedImpl>
    implements _$$signInWithGooglePressedImplCopyWith<$Res> {
  __$$signInWithGooglePressedImplCopyWithImpl(
      _$signInWithGooglePressedImpl _value,
      $Res Function(_$signInWithGooglePressedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$signInWithGooglePressedImpl implements _signInWithGooglePressed {
  const _$signInWithGooglePressedImpl();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithGooglePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$signInWithGooglePressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) {
    return signInWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) {
    return signInWithGooglePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) {
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) {
    return signInWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) {
    return signInWithGooglePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) {
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class _signInWithGooglePressed implements SignInFormEvent {
  const factory _signInWithGooglePressed() = _$signInWithGooglePressedImpl;
}

/// @nodoc
abstract class _$$resetValuesImplCopyWith<$Res> {
  factory _$$resetValuesImplCopyWith(
          _$resetValuesImpl value, $Res Function(_$resetValuesImpl) then) =
      __$$resetValuesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$resetValuesImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$resetValuesImpl>
    implements _$$resetValuesImplCopyWith<$Res> {
  __$$resetValuesImplCopyWithImpl(
      _$resetValuesImpl _value, $Res Function(_$resetValuesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$resetValuesImpl implements _resetValues {
  const _$resetValuesImpl();

  @override
  String toString() {
    return 'SignInFormEvent.resetValues()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$resetValuesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailAddressChangedEvent,
    required TResult Function(String passwordStr) passwordChangedEvent,
    required TResult Function(String role) registerWithEmailAndPasswordPressed,
    required TResult Function() signInWithEmailAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
    required TResult Function() resetValues,
  }) {
    return resetValues();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailStr)? emailAddressChangedEvent,
    TResult? Function(String passwordStr)? passwordChangedEvent,
    TResult? Function(String role)? registerWithEmailAndPasswordPressed,
    TResult? Function()? signInWithEmailAndPasswordPressed,
    TResult? Function()? signInWithGooglePressed,
    TResult? Function()? resetValues,
  }) {
    return resetValues?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailAddressChangedEvent,
    TResult Function(String passwordStr)? passwordChangedEvent,
    TResult Function(String role)? registerWithEmailAndPasswordPressed,
    TResult Function()? signInWithEmailAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    TResult Function()? resetValues,
    required TResult orElse(),
  }) {
    if (resetValues != null) {
      return resetValues();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_emailAddressChangedEvent value)
        emailAddressChangedEvent,
    required TResult Function(_passwordChangedEvent value) passwordChangedEvent,
    required TResult Function(_registerWithEmailAndPasswordPressed value)
        registerWithEmailAndPasswordPressed,
    required TResult Function(_signInWithEmailAndPasswordPressed value)
        signInWithEmailAndPasswordPressed,
    required TResult Function(_signInWithGooglePressed value)
        signInWithGooglePressed,
    required TResult Function(_resetValues value) resetValues,
  }) {
    return resetValues(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_emailAddressChangedEvent value)?
        emailAddressChangedEvent,
    TResult? Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult? Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult? Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult? Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult? Function(_resetValues value)? resetValues,
  }) {
    return resetValues?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_emailAddressChangedEvent value)? emailAddressChangedEvent,
    TResult Function(_passwordChangedEvent value)? passwordChangedEvent,
    TResult Function(_registerWithEmailAndPasswordPressed value)?
        registerWithEmailAndPasswordPressed,
    TResult Function(_signInWithEmailAndPasswordPressed value)?
        signInWithEmailAndPasswordPressed,
    TResult Function(_signInWithGooglePressed value)? signInWithGooglePressed,
    TResult Function(_resetValues value)? resetValues,
    required TResult orElse(),
  }) {
    if (resetValues != null) {
      return resetValues(this);
    }
    return orElse();
  }
}

abstract class _resetValues implements SignInFormEvent {
  const factory _resetValues() = _$resetValuesImpl;
}

/// @nodoc
mixin _$SignInFormState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get isSubmitting =>
      throw _privateConstructorUsedError; // required String role,
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<AuthFailures, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError; //option<None,some>
  Option<Either<AuthFailures, String>> get signInFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of SignInFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res, SignInFormState>;
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailures, Unit>> authFailureOrSuccessOption,
      Option<Either<AuthFailures, String>> signInFailureOrSuccessOption});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res, $Val extends SignInFormState>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? authFailureOrSuccessOption = null,
    Object? signInFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailures, Unit>>,
      signInFailureOrSuccessOption: null == signInFailureOrSuccessOption
          ? _value.signInFailureOrSuccessOption
          : signInFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailures, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInFormStateImplCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$$SignInFormStateImplCopyWith(_$SignInFormStateImpl value,
          $Res Function(_$SignInFormStateImpl) then) =
      __$$SignInFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailures, Unit>> authFailureOrSuccessOption,
      Option<Either<AuthFailures, String>> signInFailureOrSuccessOption});
}

/// @nodoc
class __$$SignInFormStateImplCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res, _$SignInFormStateImpl>
    implements _$$SignInFormStateImplCopyWith<$Res> {
  __$$SignInFormStateImplCopyWithImpl(
      _$SignInFormStateImpl _value, $Res Function(_$SignInFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? authFailureOrSuccessOption = null,
    Object? signInFailureOrSuccessOption = null,
  }) {
    return _then(_$SignInFormStateImpl(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailures, Unit>>,
      signInFailureOrSuccessOption: null == signInFailureOrSuccessOption
          ? _value.signInFailureOrSuccessOption
          : signInFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailures, String>>,
    ));
  }
}

/// @nodoc

class _$SignInFormStateImpl implements _SignInFormState {
  const _$SignInFormStateImpl(
      {required this.emailAddress,
      required this.password,
      required this.isSubmitting,
      required this.showErrorMessages,
      required this.authFailureOrSuccessOption,
      required this.signInFailureOrSuccessOption});

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final bool isSubmitting;
// required String role,
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<AuthFailures, Unit>> authFailureOrSuccessOption;
//option<None,some>
  @override
  final Option<Either<AuthFailures, String>> signInFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInFormState(emailAddress: $emailAddress, password: $password, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, authFailureOrSuccessOption: $authFailureOrSuccessOption, signInFailureOrSuccessOption: $signInFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInFormStateImpl &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption) &&
            (identical(other.signInFailureOrSuccessOption,
                    signInFailureOrSuccessOption) ||
                other.signInFailureOrSuccessOption ==
                    signInFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailAddress,
      password,
      isSubmitting,
      showErrorMessages,
      authFailureOrSuccessOption,
      signInFailureOrSuccessOption);

  /// Create a copy of SignInFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInFormStateImplCopyWith<_$SignInFormStateImpl> get copyWith =>
      __$$SignInFormStateImplCopyWithImpl<_$SignInFormStateImpl>(
          this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required final EmailAddress emailAddress,
      required final Password password,
      required final bool isSubmitting,
      required final bool showErrorMessages,
      required final Option<Either<AuthFailures, Unit>>
          authFailureOrSuccessOption,
      required final Option<Either<AuthFailures, String>>
          signInFailureOrSuccessOption}) = _$SignInFormStateImpl;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  bool get isSubmitting; // required String role,
  @override
  bool get showErrorMessages;
  @override
  Option<Either<AuthFailures, Unit>>
      get authFailureOrSuccessOption; //option<None,some>
  @override
  Option<Either<AuthFailures, String>> get signInFailureOrSuccessOption;

  /// Create a copy of SignInFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInFormStateImplCopyWith<_$SignInFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
