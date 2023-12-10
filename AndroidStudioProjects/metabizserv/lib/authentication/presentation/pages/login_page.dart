import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metabizserv/authentication/application/auth/auth_cubit.dart';
import 'package:metabizserv/authentication/presentation/widgets/auth_scaffold.dart';
import 'package:metabizserv/core/constants/images.dart';
import 'package:metabizserv/core/constants/styles.dart';
import 'package:metabizserv/core/constants/text_styles.dart';
import 'package:metabizserv/core/constants/validator_extension.dart';

import 'package:metabizserv/core/presentation/widgets/success_error_flash.dart';
import 'package:metabizserv/core/presentation/widgets/input_field.dart';
import 'package:metabizserv/core/shared/size_config.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(
      widget: LoginComponent(),
    );
  }
}

class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController resetEmailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  bool _isObscure = true;
  bool _forgotPasswordTapped = false;
  final _resetPasswordFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  void signIn() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
            email: emailIdController.text.trim(),
            password: passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            error: (failure) {
              failure.maybeWhen(
                orElse: () {},
                emailDoesNotExist: () => showErrorFlash(
                    context, "An Account with this Email Doesn't Exist"),
                noNetworkConnection: () =>
                    showErrorFlash(context, 'No Network Connection'),
                tooManyRequests: () =>
                    showErrorFlash(context, 'Too Many Requests'),
                unexpectedError: () =>
                    showErrorFlash(context, 'An Unexpected Error Occured'),
                notAdmin: () =>
                    showErrorFlash(context, 'You do not seem to be an admin!'),
                invalidEmailAndPasswordCombination: () => showErrorFlash(
                    context, 'Email and password combination is invalid!'),
              );
            });
      },
      child: Scaffold(
        backgroundColor: Styles.darkGrey,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 10),
          child: _forgotPasswordTapped
              ? Form(
                  key: _resetPasswordFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logo,
                      ),
                      const Text(
                        'Forgot your password?',
                        style: TextStyles.s20cWhite,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'No worries we\'ll send your reset instructions.',
                        style: TextStyles.s18cWhite,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.textBlack,
                            borderRadius: BorderRadius.circular(6)),
                        padding: const EdgeInsets.all(20),
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => Column(
                                children: [
                                  InputField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (String? value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !value.trim().isValidEmail()) {
                                        return 'Enter Valid Email';
                                      } else {
                                        return null;
                                      }
                                    },
                                    maxLines: 1,
                                    width: 360,
                                    controller: resetEmailIdController,
                                    hintText: 'Type Your Email',
                                  ),
                                  const SizedBox(height: 16),
                                  BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () {
                                          return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Styles.darkGrey,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                minimumSize:
                                                    const Size(408, 46),
                                              ),
                                              onPressed: () {
                                                if (_resetPasswordFormKey
                                                    .currentState!
                                                    .validate()) {
                                                  context
                                                      .read<AuthCubit>()
                                                      .sendPasswordResetEmail(
                                                          resetEmailIdController
                                                              .text
                                                              .trim());
                                                }
                                              },
                                              child: const Text(
                                                'RESET PASSWORD',
                                                style: TextStyles
                                                    .s14w400cLightGrey,
                                              ));
                                        },
                                        loading: () => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              submitted: () => const Text(
                                'We\'ve sent you an email with instructions on how to reset your password ',
                                style: TextStyles.s15w400cwhite,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () => setState(() {
                              _forgotPasswordTapped = false;
                            }),
                            child: Text(
                              'BACK TO LOGIN',
                              style:
                                  TextStyles.s18cWhite.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logo,
                      ),
                      const Text(
                        'Welcome to Meta Acedemie',
                        style: TextStyles.s20cWhite,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'It\'s great to see you again',
                        style: TextStyles.s18cWhite,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.textBlack,
                            borderRadius: BorderRadius.circular(6)),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            InputField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onComplete: () =>
                                  passwordFocusNode.requestFocus(),
                              validator: (String? value) {
                                if ((value == null ||
                                    value.isEmpty ||
                                    !value.trim().isValidEmail())) {
                                  return 'Enter Valid Email';
                                } else {
                                  return null;
                                }
                              },
                              maxLines: 1,
                              width: 360,
                              controller: emailIdController,
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 16),
                            InputField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onComplete: () => signIn(),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                splashRadius: 18,
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: _isObscure
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                              ),
                              focusNode: passwordFocusNode,
                              maxLines: 1,
                              validator: (String? value) {
                                if ((value == null ||
                                    value.isEmpty ||
                                    !value.trim().isValidPassword())) {
                                  return 'Enter Valid Password';
                                } else {
                                  return null;
                                }
                              },
                              width: 360,
                              obscureText: _isObscure,
                              controller: passwordController,
                              hintText: 'Password',
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Styles.blueColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    minimumSize: const Size(408, 46),
                                  ),
                                  onPressed: () => signIn(),
                                  child: const Text(
                                    'SIGN IN',
                                    style: TextStyles.s16w400cwhite,
                                  ));
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () => setState(() {
                              _forgotPasswordTapped = true;
                            }),
                            child: Text(
                              'FORGOT PASSWORD',
                              style:
                                  TextStyles.s18cWhite.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailIdController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
