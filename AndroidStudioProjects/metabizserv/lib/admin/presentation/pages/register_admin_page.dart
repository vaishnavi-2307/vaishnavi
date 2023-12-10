import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metabizserv/admin/application/admin_registration_cubit.dart';
import 'package:metabizserv/core/presentation/widgets/success_error_flash.dart';

class RegisterAdminPage extends StatefulWidget {
  const RegisterAdminPage({Key? key}) : super(key: key);

  @override
  State<RegisterAdminPage> createState() => _RegisterAdminPageState();
}

class _RegisterAdminPageState extends State<RegisterAdminPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  void _clearFields() {
    _emailController.clear();
    _passwordController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminRegistrationCubit, AdminRegistrationState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            success: (_, __, ___, ____, _____) {
              showSuccessFlash(context, 'Admin Registration Successful!');
              _clearFields();
            },
            error: (_, __, ___, ____, _____, failure) {
              failure.maybeWhen(
                  orElse: () {},
                  emailInUse: () =>
                      showErrorFlash(context, 'Email is already registered!'));
            });
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register New Admin',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  controller: _firstNameController,
                  onChanged:
                      context.read<AdminRegistrationCubit>().firstNameChanged,
                  validator: (value) {
                    if (value!.length < 3) {
                      return 'This field should be greater than 3 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(label: Text('First Name')),
                ),
                TextFormField(
                  controller: _lastNameController,
                  onChanged:
                      context.read<AdminRegistrationCubit>().lastNameChanged,
                  validator: (value) {
                    if (value!.length < 3) {
                      return 'This field should be greater than 3 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(label: Text('Last Name')),
                ),
                TextFormField(
                  onChanged:
                      context.read<AdminRegistrationCubit>().emailChanged,
                  controller: _emailController,
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(label: Text('Email')),
                ),
                TextFormField(
                  onChanged:
                      context.read<AdminRegistrationCubit>().passwordChanged,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Password should be greater than 5 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(label: Text('Password')),
                ),
                const SizedBox(
                  height: 48,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: BlocBuilder<AdminRegistrationCubit,
                        AdminRegistrationState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                            loading: (_, __, ___, ____, _____) =>
                                const CircularProgressIndicator(),
                            orElse: () => ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<AdminRegistrationCubit>()
                                          .submit();
                                    }
                                  },
                                  child: const Text('Login'),
                                ));
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
