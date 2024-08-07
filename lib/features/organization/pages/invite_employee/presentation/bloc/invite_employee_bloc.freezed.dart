// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_employee_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InviteEmployeeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendInvite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendInvite value) sendInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendInvite value)? sendInvite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendInvite value)? sendInvite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteEmployeeEventCopyWith<$Res> {
  factory $InviteEmployeeEventCopyWith(
          InviteEmployeeEvent value, $Res Function(InviteEmployeeEvent) then) =
      _$InviteEmployeeEventCopyWithImpl<$Res, InviteEmployeeEvent>;
}

/// @nodoc
class _$InviteEmployeeEventCopyWithImpl<$Res, $Val extends InviteEmployeeEvent>
    implements $InviteEmployeeEventCopyWith<$Res> {
  _$InviteEmployeeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendInviteImplCopyWith<$Res> {
  factory _$$SendInviteImplCopyWith(
          _$SendInviteImpl value, $Res Function(_$SendInviteImpl) then) =
      __$$SendInviteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendInviteImplCopyWithImpl<$Res>
    extends _$InviteEmployeeEventCopyWithImpl<$Res, _$SendInviteImpl>
    implements _$$SendInviteImplCopyWith<$Res> {
  __$$SendInviteImplCopyWithImpl(
      _$SendInviteImpl _value, $Res Function(_$SendInviteImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendInviteImpl implements _SendInvite {
  const _$SendInviteImpl();

  @override
  String toString() {
    return 'InviteEmployeeEvent.sendInvite()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendInviteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendInvite,
  }) {
    return sendInvite();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendInvite,
  }) {
    return sendInvite?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendInvite,
    required TResult orElse(),
  }) {
    if (sendInvite != null) {
      return sendInvite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendInvite value) sendInvite,
  }) {
    return sendInvite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendInvite value)? sendInvite,
  }) {
    return sendInvite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendInvite value)? sendInvite,
    required TResult orElse(),
  }) {
    if (sendInvite != null) {
      return sendInvite(this);
    }
    return orElse();
  }
}

abstract class _SendInvite implements InviteEmployeeEvent {
  const factory _SendInvite() = _$SendInviteImpl;
}

/// @nodoc
mixin _$InviteEmployeeState {
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InviteEmployeeStateCopyWith<InviteEmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteEmployeeStateCopyWith<$Res> {
  factory $InviteEmployeeStateCopyWith(
          InviteEmployeeState value, $Res Function(InviteEmployeeState) then) =
      _$InviteEmployeeStateCopyWithImpl<$Res, InviteEmployeeState>;
  @useResult
  $Res call({StateStatus stateStatus});

  $StateStatusCopyWith<$Res> get stateStatus;
}

/// @nodoc
class _$InviteEmployeeStateCopyWithImpl<$Res, $Val extends InviteEmployeeState>
    implements $InviteEmployeeStateCopyWith<$Res> {
  _$InviteEmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateStatusCopyWith<$Res> get stateStatus {
    return $StateStatusCopyWith<$Res>(_value.stateStatus, (value) {
      return _then(_value.copyWith(stateStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InviteEmployeeStateImplCopyWith<$Res>
    implements $InviteEmployeeStateCopyWith<$Res> {
  factory _$$InviteEmployeeStateImplCopyWith(_$InviteEmployeeStateImpl value,
          $Res Function(_$InviteEmployeeStateImpl) then) =
      __$$InviteEmployeeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus stateStatus});

  @override
  $StateStatusCopyWith<$Res> get stateStatus;
}

/// @nodoc
class __$$InviteEmployeeStateImplCopyWithImpl<$Res>
    extends _$InviteEmployeeStateCopyWithImpl<$Res, _$InviteEmployeeStateImpl>
    implements _$$InviteEmployeeStateImplCopyWith<$Res> {
  __$$InviteEmployeeStateImplCopyWithImpl(_$InviteEmployeeStateImpl _value,
      $Res Function(_$InviteEmployeeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateStatus = null,
  }) {
    return _then(_$InviteEmployeeStateImpl(
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$InviteEmployeeStateImpl implements _InviteEmployeeState {
  const _$InviteEmployeeStateImpl({required this.stateStatus});

  @override
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'InviteEmployeeState(stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteEmployeeStateImpl &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteEmployeeStateImplCopyWith<_$InviteEmployeeStateImpl> get copyWith =>
      __$$InviteEmployeeStateImplCopyWithImpl<_$InviteEmployeeStateImpl>(
          this, _$identity);
}

abstract class _InviteEmployeeState implements InviteEmployeeState {
  const factory _InviteEmployeeState({required final StateStatus stateStatus}) =
      _$InviteEmployeeStateImpl;

  @override
  StateStatus get stateStatus;
  @override
  @JsonKey(ignore: true)
  _$$InviteEmployeeStateImplCopyWith<_$InviteEmployeeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
