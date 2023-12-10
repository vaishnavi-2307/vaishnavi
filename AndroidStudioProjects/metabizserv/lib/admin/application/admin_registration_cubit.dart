import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metabizserv/admin/infrastructure/admin_repository.dart';
import 'package:metabizserv/authentication/domain/auth_failure.dart';
part 'admin_registration_state.dart';
part 'admin_registration_cubit.freezed.dart';

class AdminRegistrationCubit extends Cubit<AdminRegistrationState> {
  final AdminRepository _adminRepository;

  AdminRegistrationCubit(
    this._adminRepository,
  ) : super(const AdminRegistrationState.initial(
          isValueChanged: false,
          firstName: '',
          lastName: '',
          email: '',
          password: '',
        ));

  void firstNameChanged(String value) {
    emit(state.copyWith(firstName: value, isValueChanged: true));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(lastName: value, isValueChanged: true));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, isValueChanged: true));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, isValueChanged: true));
  }

  Future<void> submit() async {
    emit(AdminRegistrationState.loading(
      isValueChanged: false,
      firstName: state.firstName,
      lastName: state.lastName,
      email: state.email,
      password: state.password,
    ));

    final failureOrSuccess = await _adminRepository.createAdmin(
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        password: state.password);

    failureOrSuccess.fold(
      (failure) => emit(
        AdminRegistrationState.error(
            isValueChanged: false,
            firstName: state.firstName,
            lastName: state.lastName,
            email: state.email,
            password: state.password,
            failure: failure),
      ),
      (r) => emit(
        AdminRegistrationState.success(
          isValueChanged: true,
          firstName: state.firstName,
          lastName: state.lastName,
          email: state.email,
          password: state.password,
        ),
      ),
    );

    emit(
      const AdminRegistrationState.initial(
        isValueChanged: false,
        firstName: '',
        lastName: '',
        email: '',
        password: '',
      ),
    );
  }
}
