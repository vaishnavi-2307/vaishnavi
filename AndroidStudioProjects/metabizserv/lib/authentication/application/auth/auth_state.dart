part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({required Admin admin}) =
      _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
  const factory AuthState.submitted() = _Submitted;
  const factory AuthState.error(AuthFailure failure) = _Error;
}
