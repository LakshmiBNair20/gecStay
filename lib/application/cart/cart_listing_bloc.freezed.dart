// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_listing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartListingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBookingHistoryForStudent,
    required TResult Function(String userId) loadBookingHistoryForOnwer,
    required TResult Function(String bookingId) cancelBookingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBookingHistoryForStudent,
    TResult? Function(String userId)? loadBookingHistoryForOnwer,
    TResult? Function(String bookingId)? cancelBookingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBookingHistoryForStudent,
    TResult Function(String userId)? loadBookingHistoryForOnwer,
    TResult Function(String bookingId)? cancelBookingEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadBookingHistoryForStudent value)
        loadBookingHistoryForStudent,
    required TResult Function(_loadBookingHistoryForOwner value)
        loadBookingHistoryForOnwer,
    required TResult Function(_CancelBookingEvent value) cancelBookingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult? Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult? Function(_CancelBookingEvent value)? cancelBookingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult Function(_CancelBookingEvent value)? cancelBookingEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartListingEventCopyWith<$Res> {
  factory $CartListingEventCopyWith(
          CartListingEvent value, $Res Function(CartListingEvent) then) =
      _$CartListingEventCopyWithImpl<$Res, CartListingEvent>;
}

/// @nodoc
class _$CartListingEventCopyWithImpl<$Res, $Val extends CartListingEvent>
    implements $CartListingEventCopyWith<$Res> {
  _$CartListingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$loadBookingHistoryForStudentImplCopyWith<$Res> {
  factory _$$loadBookingHistoryForStudentImplCopyWith(
          _$loadBookingHistoryForStudentImpl value,
          $Res Function(_$loadBookingHistoryForStudentImpl) then) =
      __$$loadBookingHistoryForStudentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$loadBookingHistoryForStudentImplCopyWithImpl<$Res>
    extends _$CartListingEventCopyWithImpl<$Res,
        _$loadBookingHistoryForStudentImpl>
    implements _$$loadBookingHistoryForStudentImplCopyWith<$Res> {
  __$$loadBookingHistoryForStudentImplCopyWithImpl(
      _$loadBookingHistoryForStudentImpl _value,
      $Res Function(_$loadBookingHistoryForStudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$loadBookingHistoryForStudentImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$loadBookingHistoryForStudentImpl
    implements _loadBookingHistoryForStudent {
  const _$loadBookingHistoryForStudentImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CartListingEvent.loadBookingHistoryForStudent(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadBookingHistoryForStudentImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$loadBookingHistoryForStudentImplCopyWith<
          _$loadBookingHistoryForStudentImpl>
      get copyWith => __$$loadBookingHistoryForStudentImplCopyWithImpl<
          _$loadBookingHistoryForStudentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBookingHistoryForStudent,
    required TResult Function(String userId) loadBookingHistoryForOnwer,
    required TResult Function(String bookingId) cancelBookingEvent,
  }) {
    return loadBookingHistoryForStudent(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBookingHistoryForStudent,
    TResult? Function(String userId)? loadBookingHistoryForOnwer,
    TResult? Function(String bookingId)? cancelBookingEvent,
  }) {
    return loadBookingHistoryForStudent?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBookingHistoryForStudent,
    TResult Function(String userId)? loadBookingHistoryForOnwer,
    TResult Function(String bookingId)? cancelBookingEvent,
    required TResult orElse(),
  }) {
    if (loadBookingHistoryForStudent != null) {
      return loadBookingHistoryForStudent(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadBookingHistoryForStudent value)
        loadBookingHistoryForStudent,
    required TResult Function(_loadBookingHistoryForOwner value)
        loadBookingHistoryForOnwer,
    required TResult Function(_CancelBookingEvent value) cancelBookingEvent,
  }) {
    return loadBookingHistoryForStudent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult? Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult? Function(_CancelBookingEvent value)? cancelBookingEvent,
  }) {
    return loadBookingHistoryForStudent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult Function(_CancelBookingEvent value)? cancelBookingEvent,
    required TResult orElse(),
  }) {
    if (loadBookingHistoryForStudent != null) {
      return loadBookingHistoryForStudent(this);
    }
    return orElse();
  }
}

abstract class _loadBookingHistoryForStudent implements CartListingEvent {
  const factory _loadBookingHistoryForStudent({required final String userId}) =
      _$loadBookingHistoryForStudentImpl;

  String get userId;

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$loadBookingHistoryForStudentImplCopyWith<
          _$loadBookingHistoryForStudentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loadBookingHistoryForOwnerImplCopyWith<$Res> {
  factory _$$loadBookingHistoryForOwnerImplCopyWith(
          _$loadBookingHistoryForOwnerImpl value,
          $Res Function(_$loadBookingHistoryForOwnerImpl) then) =
      __$$loadBookingHistoryForOwnerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$loadBookingHistoryForOwnerImplCopyWithImpl<$Res>
    extends _$CartListingEventCopyWithImpl<$Res,
        _$loadBookingHistoryForOwnerImpl>
    implements _$$loadBookingHistoryForOwnerImplCopyWith<$Res> {
  __$$loadBookingHistoryForOwnerImplCopyWithImpl(
      _$loadBookingHistoryForOwnerImpl _value,
      $Res Function(_$loadBookingHistoryForOwnerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$loadBookingHistoryForOwnerImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$loadBookingHistoryForOwnerImpl implements _loadBookingHistoryForOwner {
  const _$loadBookingHistoryForOwnerImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CartListingEvent.loadBookingHistoryForOnwer(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadBookingHistoryForOwnerImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$loadBookingHistoryForOwnerImplCopyWith<_$loadBookingHistoryForOwnerImpl>
      get copyWith => __$$loadBookingHistoryForOwnerImplCopyWithImpl<
          _$loadBookingHistoryForOwnerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBookingHistoryForStudent,
    required TResult Function(String userId) loadBookingHistoryForOnwer,
    required TResult Function(String bookingId) cancelBookingEvent,
  }) {
    return loadBookingHistoryForOnwer(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBookingHistoryForStudent,
    TResult? Function(String userId)? loadBookingHistoryForOnwer,
    TResult? Function(String bookingId)? cancelBookingEvent,
  }) {
    return loadBookingHistoryForOnwer?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBookingHistoryForStudent,
    TResult Function(String userId)? loadBookingHistoryForOnwer,
    TResult Function(String bookingId)? cancelBookingEvent,
    required TResult orElse(),
  }) {
    if (loadBookingHistoryForOnwer != null) {
      return loadBookingHistoryForOnwer(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadBookingHistoryForStudent value)
        loadBookingHistoryForStudent,
    required TResult Function(_loadBookingHistoryForOwner value)
        loadBookingHistoryForOnwer,
    required TResult Function(_CancelBookingEvent value) cancelBookingEvent,
  }) {
    return loadBookingHistoryForOnwer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult? Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult? Function(_CancelBookingEvent value)? cancelBookingEvent,
  }) {
    return loadBookingHistoryForOnwer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult Function(_CancelBookingEvent value)? cancelBookingEvent,
    required TResult orElse(),
  }) {
    if (loadBookingHistoryForOnwer != null) {
      return loadBookingHistoryForOnwer(this);
    }
    return orElse();
  }
}

abstract class _loadBookingHistoryForOwner implements CartListingEvent {
  const factory _loadBookingHistoryForOwner({required final String userId}) =
      _$loadBookingHistoryForOwnerImpl;

  String get userId;

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$loadBookingHistoryForOwnerImplCopyWith<_$loadBookingHistoryForOwnerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelBookingEventImplCopyWith<$Res> {
  factory _$$CancelBookingEventImplCopyWith(_$CancelBookingEventImpl value,
          $Res Function(_$CancelBookingEventImpl) then) =
      __$$CancelBookingEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bookingId});
}

/// @nodoc
class __$$CancelBookingEventImplCopyWithImpl<$Res>
    extends _$CartListingEventCopyWithImpl<$Res, _$CancelBookingEventImpl>
    implements _$$CancelBookingEventImplCopyWith<$Res> {
  __$$CancelBookingEventImplCopyWithImpl(_$CancelBookingEventImpl _value,
      $Res Function(_$CancelBookingEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
  }) {
    return _then(_$CancelBookingEventImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelBookingEventImpl implements _CancelBookingEvent {
  const _$CancelBookingEventImpl({required this.bookingId});

  @override
  final String bookingId;

  @override
  String toString() {
    return 'CartListingEvent.cancelBookingEvent(bookingId: $bookingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelBookingEventImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookingId);

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelBookingEventImplCopyWith<_$CancelBookingEventImpl> get copyWith =>
      __$$CancelBookingEventImplCopyWithImpl<_$CancelBookingEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBookingHistoryForStudent,
    required TResult Function(String userId) loadBookingHistoryForOnwer,
    required TResult Function(String bookingId) cancelBookingEvent,
  }) {
    return cancelBookingEvent(bookingId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBookingHistoryForStudent,
    TResult? Function(String userId)? loadBookingHistoryForOnwer,
    TResult? Function(String bookingId)? cancelBookingEvent,
  }) {
    return cancelBookingEvent?.call(bookingId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBookingHistoryForStudent,
    TResult Function(String userId)? loadBookingHistoryForOnwer,
    TResult Function(String bookingId)? cancelBookingEvent,
    required TResult orElse(),
  }) {
    if (cancelBookingEvent != null) {
      return cancelBookingEvent(bookingId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadBookingHistoryForStudent value)
        loadBookingHistoryForStudent,
    required TResult Function(_loadBookingHistoryForOwner value)
        loadBookingHistoryForOnwer,
    required TResult Function(_CancelBookingEvent value) cancelBookingEvent,
  }) {
    return cancelBookingEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult? Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult? Function(_CancelBookingEvent value)? cancelBookingEvent,
  }) {
    return cancelBookingEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadBookingHistoryForStudent value)?
        loadBookingHistoryForStudent,
    TResult Function(_loadBookingHistoryForOwner value)?
        loadBookingHistoryForOnwer,
    TResult Function(_CancelBookingEvent value)? cancelBookingEvent,
    required TResult orElse(),
  }) {
    if (cancelBookingEvent != null) {
      return cancelBookingEvent(this);
    }
    return orElse();
  }
}

abstract class _CancelBookingEvent implements CartListingEvent {
  const factory _CancelBookingEvent({required final String bookingId}) =
      _$CancelBookingEventImpl;

  String get bookingId;

  /// Create a copy of CartListingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelBookingEventImplCopyWith<_$CancelBookingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartListingState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isCancelling => throw _privateConstructorUsedError;
  Option<Either<FormFailures, List<Map<String, dynamic>>>>
      get fetchSuccessOrFailureOption => throw _privateConstructorUsedError;
  String get processingBookingId => throw _privateConstructorUsedError;
  Option<Either<FormFailures, Unit>> get successOrFailureOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of CartListingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartListingStateCopyWith<CartListingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartListingStateCopyWith<$Res> {
  factory $CartListingStateCopyWith(
          CartListingState value, $Res Function(CartListingState) then) =
      _$CartListingStateCopyWithImpl<$Res, CartListingState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      bool isCancelling,
      Option<Either<FormFailures, List<Map<String, dynamic>>>>
          fetchSuccessOrFailureOption,
      String processingBookingId,
      Option<Either<FormFailures, Unit>> successOrFailureOption});
}

/// @nodoc
class _$CartListingStateCopyWithImpl<$Res, $Val extends CartListingState>
    implements $CartListingStateCopyWith<$Res> {
  _$CartListingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartListingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? isCancelling = null,
    Object? fetchSuccessOrFailureOption = null,
    Object? processingBookingId = null,
    Object? successOrFailureOption = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelling: null == isCancelling
          ? _value.isCancelling
          : isCancelling // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSuccessOrFailureOption: null == fetchSuccessOrFailureOption
          ? _value.fetchSuccessOrFailureOption
          : fetchSuccessOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FormFailures, List<Map<String, dynamic>>>>,
      processingBookingId: null == processingBookingId
          ? _value.processingBookingId
          : processingBookingId // ignore: cast_nullable_to_non_nullable
              as String,
      successOrFailureOption: null == successOrFailureOption
          ? _value.successOrFailureOption
          : successOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FormFailures, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartListingStateImplCopyWith<$Res>
    implements $CartListingStateCopyWith<$Res> {
  factory _$$CartListingStateImplCopyWith(_$CartListingStateImpl value,
          $Res Function(_$CartListingStateImpl) then) =
      __$$CartListingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      bool isCancelling,
      Option<Either<FormFailures, List<Map<String, dynamic>>>>
          fetchSuccessOrFailureOption,
      String processingBookingId,
      Option<Either<FormFailures, Unit>> successOrFailureOption});
}

/// @nodoc
class __$$CartListingStateImplCopyWithImpl<$Res>
    extends _$CartListingStateCopyWithImpl<$Res, _$CartListingStateImpl>
    implements _$$CartListingStateImplCopyWith<$Res> {
  __$$CartListingStateImplCopyWithImpl(_$CartListingStateImpl _value,
      $Res Function(_$CartListingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartListingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? isCancelling = null,
    Object? fetchSuccessOrFailureOption = null,
    Object? processingBookingId = null,
    Object? successOrFailureOption = null,
  }) {
    return _then(_$CartListingStateImpl(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelling: null == isCancelling
          ? _value.isCancelling
          : isCancelling // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSuccessOrFailureOption: null == fetchSuccessOrFailureOption
          ? _value.fetchSuccessOrFailureOption
          : fetchSuccessOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FormFailures, List<Map<String, dynamic>>>>,
      processingBookingId: null == processingBookingId
          ? _value.processingBookingId
          : processingBookingId // ignore: cast_nullable_to_non_nullable
              as String,
      successOrFailureOption: null == successOrFailureOption
          ? _value.successOrFailureOption
          : successOrFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FormFailures, Unit>>,
    ));
  }
}

/// @nodoc

class _$CartListingStateImpl implements _CartListingState {
  _$CartListingStateImpl(
      {required this.isSubmitting,
      required this.isCancelling,
      required this.fetchSuccessOrFailureOption,
      required this.processingBookingId,
      required this.successOrFailureOption});

  @override
  final bool isSubmitting;
  @override
  final bool isCancelling;
  @override
  final Option<Either<FormFailures, List<Map<String, dynamic>>>>
      fetchSuccessOrFailureOption;
  @override
  final String processingBookingId;
  @override
  final Option<Either<FormFailures, Unit>> successOrFailureOption;

  @override
  String toString() {
    return 'CartListingState(isSubmitting: $isSubmitting, isCancelling: $isCancelling, fetchSuccessOrFailureOption: $fetchSuccessOrFailureOption, processingBookingId: $processingBookingId, successOrFailureOption: $successOrFailureOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartListingStateImpl &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isCancelling, isCancelling) ||
                other.isCancelling == isCancelling) &&
            (identical(other.fetchSuccessOrFailureOption,
                    fetchSuccessOrFailureOption) ||
                other.fetchSuccessOrFailureOption ==
                    fetchSuccessOrFailureOption) &&
            (identical(other.processingBookingId, processingBookingId) ||
                other.processingBookingId == processingBookingId) &&
            (identical(other.successOrFailureOption, successOrFailureOption) ||
                other.successOrFailureOption == successOrFailureOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSubmitting, isCancelling,
      fetchSuccessOrFailureOption, processingBookingId, successOrFailureOption);

  /// Create a copy of CartListingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartListingStateImplCopyWith<_$CartListingStateImpl> get copyWith =>
      __$$CartListingStateImplCopyWithImpl<_$CartListingStateImpl>(
          this, _$identity);
}

abstract class _CartListingState implements CartListingState {
  factory _CartListingState(
      {required final bool isSubmitting,
      required final bool isCancelling,
      required final Option<Either<FormFailures, List<Map<String, dynamic>>>>
          fetchSuccessOrFailureOption,
      required final String processingBookingId,
      required final Option<Either<FormFailures, Unit>>
          successOrFailureOption}) = _$CartListingStateImpl;

  @override
  bool get isSubmitting;
  @override
  bool get isCancelling;
  @override
  Option<Either<FormFailures, List<Map<String, dynamic>>>>
      get fetchSuccessOrFailureOption;
  @override
  String get processingBookingId;
  @override
  Option<Either<FormFailures, Unit>> get successOrFailureOption;

  /// Create a copy of CartListingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartListingStateImplCopyWith<_$CartListingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
