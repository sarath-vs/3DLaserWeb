// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkExceptions {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkExceptionsCopyWith<NetworkExceptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkExceptionsCopyWith<$Res> {
  factory $NetworkExceptionsCopyWith(
          NetworkExceptions value, $Res Function(NetworkExceptions) then) =
      _$NetworkExceptionsCopyWithImpl<$Res, NetworkExceptions>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NetworkExceptionsCopyWithImpl<$Res, $Val extends NetworkExceptions>
    implements $NetworkExceptionsCopyWith<$Res> {
  _$NetworkExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExceptionCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$ExceptionCopyWith(
          _$Exception value, $Res Function(_$Exception) then) =
      __$$ExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$Exception>
    implements _$$ExceptionCopyWith<$Res> {
  __$$ExceptionCopyWithImpl(
      _$Exception _value, $Res Function(_$Exception) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Exception(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Exception implements Exception {
  const _$Exception(
      [this.message = 'Unknown error occured. Contact customer service']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.Exception(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Exception &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceptionCopyWith<_$Exception> get copyWith =>
      __$$ExceptionCopyWithImpl<_$Exception>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return Exception(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return Exception?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (Exception != null) {
      return Exception(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return Exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return Exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (Exception != null) {
      return Exception(this);
    }
    return orElse();
  }
}

abstract class Exception implements NetworkExceptions {
  const factory Exception([final String message]) = _$Exception;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ExceptionCopyWith<_$Exception> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$NotFoundCopyWith(
          _$NotFound value, $Res Function(_$NotFound) then) =
      __$$NotFoundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$NotFound>
    implements _$$NotFoundCopyWith<$Res> {
  __$$NotFoundCopyWithImpl(_$NotFound _value, $Res Function(_$NotFound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFound(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFound implements NotFound {
  const _$NotFound([this.message = 'Invalid User name / password']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.notFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFound &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundCopyWith<_$NotFound> get copyWith =>
      __$$NotFoundCopyWithImpl<_$NotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements NetworkExceptions {
  const factory NotFound([final String message]) = _$NotFound;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundCopyWith<_$NotFound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeOutCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$TimeOutCopyWith(_$TimeOut value, $Res Function(_$TimeOut) then) =
      __$$TimeOutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeOutCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$TimeOut>
    implements _$$TimeOutCopyWith<$Res> {
  __$$TimeOutCopyWithImpl(_$TimeOut _value, $Res Function(_$TimeOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeOut(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeOut implements TimeOut {
  const _$TimeOut([this.message = 'Time out']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.timeOut(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOut &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOutCopyWith<_$TimeOut> get copyWith =>
      __$$TimeOutCopyWithImpl<_$TimeOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return timeOut(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return timeOut?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class TimeOut implements NetworkExceptions {
  const factory TimeOut([final String message]) = _$TimeOut;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$TimeOutCopyWith<_$TimeOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Error(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error([this.message = 'Time out']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements NetworkExceptions {
  const factory Error([final String message]) = _$Error;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternalServerErrorCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$InternalServerErrorCopyWith(_$InternalServerError value,
          $Res Function(_$InternalServerError) then) =
      __$$InternalServerErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InternalServerErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$InternalServerError>
    implements _$$InternalServerErrorCopyWith<$Res> {
  __$$InternalServerErrorCopyWithImpl(
      _$InternalServerError _value, $Res Function(_$InternalServerError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InternalServerError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InternalServerError implements InternalServerError {
  const _$InternalServerError([this.message = 'Internal server error']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.internalServerError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalServerError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalServerErrorCopyWith<_$InternalServerError> get copyWith =>
      __$$InternalServerErrorCopyWithImpl<_$InternalServerError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return internalServerError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return internalServerError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return internalServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return internalServerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(this);
    }
    return orElse();
  }
}

abstract class InternalServerError implements NetworkExceptions {
  const factory InternalServerError([final String message]) =
      _$InternalServerError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$InternalServerErrorCopyWith<_$InternalServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnKnownErrorCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$UnKnownErrorCopyWith(
          _$UnKnownError value, $Res Function(_$UnKnownError) then) =
      __$$UnKnownErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnKnownErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$UnKnownError>
    implements _$$UnKnownErrorCopyWith<$Res> {
  __$$UnKnownErrorCopyWithImpl(
      _$UnKnownError _value, $Res Function(_$UnKnownError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnKnownError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnKnownError implements UnKnownError {
  const _$UnKnownError([this.message = 'Unknown error occured']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.unKnownError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnKnownError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnKnownErrorCopyWith<_$UnKnownError> get copyWith =>
      __$$UnKnownErrorCopyWithImpl<_$UnKnownError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return unKnownError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return unKnownError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (unKnownError != null) {
      return unKnownError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return unKnownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return unKnownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (unKnownError != null) {
      return unKnownError(this);
    }
    return orElse();
  }
}

abstract class UnKnownError implements NetworkExceptions {
  const factory UnKnownError([final String message]) = _$UnKnownError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnKnownErrorCopyWith<_$UnKnownError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory _$$NoInternetCopyWith(
          _$NoInternet value, $Res Function(_$NoInternet) then) =
      __$$NoInternetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoInternetCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res, _$NoInternet>
    implements _$$NoInternetCopyWith<$Res> {
  __$$NoInternetCopyWithImpl(
      _$NoInternet _value, $Res Function(_$NoInternet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoInternet(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoInternet implements NoInternet {
  const _$NoInternet([this.message = 'Network unavailable']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NetworkExceptions.noInternet(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternet &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoInternetCopyWith<_$NoInternet> get copyWith =>
      __$$NoInternetCopyWithImpl<_$NoInternet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) Exception,
    required TResult Function(String message) notFound,
    required TResult Function(String message) timeOut,
    required TResult Function(String message) error,
    required TResult Function(String message) internalServerError,
    required TResult Function(String message) unKnownError,
    required TResult Function(String message) noInternet,
  }) {
    return noInternet(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? Exception,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? timeOut,
    TResult? Function(String message)? error,
    TResult? Function(String message)? internalServerError,
    TResult? Function(String message)? unKnownError,
    TResult? Function(String message)? noInternet,
  }) {
    return noInternet?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? Exception,
    TResult Function(String message)? notFound,
    TResult Function(String message)? timeOut,
    TResult Function(String message)? error,
    TResult Function(String message)? internalServerError,
    TResult Function(String message)? unKnownError,
    TResult Function(String message)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Exception value) Exception,
    required TResult Function(NotFound value) notFound,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(Error value) error,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(UnKnownError value) unKnownError,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Exception value)? Exception,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(Error value)? error,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(UnKnownError value)? unKnownError,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Exception value)? Exception,
    TResult Function(NotFound value)? notFound,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(Error value)? error,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(UnKnownError value)? unKnownError,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternet implements NetworkExceptions {
  const factory NoInternet([final String message]) = _$NoInternet;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NoInternetCopyWith<_$NoInternet> get copyWith =>
      throw _privateConstructorUsedError;
}
