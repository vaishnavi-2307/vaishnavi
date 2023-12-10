import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metabizserv/admin/infrastructure/admin_repository.dart';
import 'package:metabizserv/authentication/domain/admin.dart';
import 'package:metabizserv/authentication/domain/auth_failure.dart';
import 'package:metabizserv/authentication/infrastructure/auth_service.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final AdminRepository _adminService;

  AuthCubit(
    this._authService,
    this._adminService,
  ) : super(const AuthState.initial()) {
    _authService.authStateChanges.listen((firebaseUser) async {
      if (firebaseUser != null) {
        final admin = await _adminService.fetchAdmin(firebaseUser.uid);
        if (admin != null && admin.isSuperAdmin) {
          emit(AuthState.authenticated(admin: admin));
        } else {
          emit(const AuthState.error(AuthFailure.notAdmin()));
          await _authService.signOut();
        }
      } else {
        emit(const AuthState.unAuthenticated());
      }
    });
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final failureOrSuccess =
        await _authService.signInWithEmailAndPassword(email, password);
    failureOrSuccess.fold((failure) => emit(AuthState.error(failure)), (r) {});
  }

  Future<void> sendPasswordResetEmail(String email) async {
    emit(const AuthState.loading());
    final failureOrSuccess = await _authService.sendPasswordResetEmail(email);
    failureOrSuccess.fold(
      (failure) => emit(AuthState.error(failure)),
      (r) => emit(const AuthState.submitted()),
    );
  }

  Future<void> signOut() {
    return _authService.signOut();
  }
}
