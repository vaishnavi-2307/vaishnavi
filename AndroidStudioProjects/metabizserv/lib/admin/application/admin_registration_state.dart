part of 'admin_registration_cubit.dart';

@freezed
class AdminRegistrationState with _$AdminRegistrationState {
  const factory AdminRegistrationState.initial({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required bool isValueChanged,
  }) = _Initial;

  const factory AdminRegistrationState.loading({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required bool isValueChanged,
  }) = _Loading;

  const factory AdminRegistrationState.success({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required bool isValueChanged,
  }) = _Success;

  const factory AdminRegistrationState.error({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required bool isValueChanged,
    required AuthFailure failure,
  }) = _Error;
}
