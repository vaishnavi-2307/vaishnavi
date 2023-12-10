// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return _Admin.fromJson(json);
}

/// @nodoc
mixin _$Admin {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminCopyWith<Admin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCopyWith<$Res> {
  factory $AdminCopyWith(Admin value, $Res Function(Admin) then) =
      _$AdminCopyWithImpl<$Res, Admin>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      bool isSuperAdmin,
      @TimestampConverter() DateTime createdOn});
}

/// @nodoc
class _$AdminCopyWithImpl<$Res, $Val extends Admin>
    implements $AdminCopyWith<$Res> {
  _$AdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? isSuperAdmin = null,
    Object? createdOn = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminImplCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$$AdminImplCopyWith(
          _$AdminImpl value, $Res Function(_$AdminImpl) then) =
      __$$AdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      bool isSuperAdmin,
      @TimestampConverter() DateTime createdOn});
}

/// @nodoc
class __$$AdminImplCopyWithImpl<$Res>
    extends _$AdminCopyWithImpl<$Res, _$AdminImpl>
    implements _$$AdminImplCopyWith<$Res> {
  __$$AdminImplCopyWithImpl(
      _$AdminImpl _value, $Res Function(_$AdminImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? isSuperAdmin = null,
    Object? createdOn = null,
  }) {
    return _then(_$AdminImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminImpl extends _Admin {
  const _$AdminImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.isSuperAdmin,
      @TimestampConverter() required this.createdOn})
      : super._();

  factory _$AdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final bool isSuperAdmin;
  @override
  @TimestampConverter()
  final DateTime createdOn;

  @override
  String toString() {
    return 'Admin(firstName: $firstName, lastName: $lastName, email: $email, isSuperAdmin: $isSuperAdmin, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, email, isSuperAdmin, createdOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminImplCopyWith<_$AdminImpl> get copyWith =>
      __$$AdminImplCopyWithImpl<_$AdminImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminImplToJson(
      this,
    );
  }
}

abstract class _Admin extends Admin {
  const factory _Admin(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final bool isSuperAdmin,
      @TimestampConverter() required final DateTime createdOn}) = _$AdminImpl;
  const _Admin._() : super._();

  factory _Admin.fromJson(Map<String, dynamic> json) = _$AdminImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  bool get isSuperAdmin;
  @override
  @TimestampConverter()
  DateTime get createdOn;
  @override
  @JsonKey(ignore: true)
  _$$AdminImplCopyWith<_$AdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
