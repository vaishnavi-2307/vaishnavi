import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metabizserv/core/models/timestamp_converter.dart';
part 'admin.freezed.dart';
part 'admin.g.dart';

@freezed
class Admin with _$Admin {
  const Admin._();
  const factory Admin({
    required String firstName,
    required String lastName,
    required String email,
    required bool isSuperAdmin,
    @TimestampConverter() required DateTime createdOn,
  }) = _Admin;

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
}
