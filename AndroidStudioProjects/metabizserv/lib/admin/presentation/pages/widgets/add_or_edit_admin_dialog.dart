// import 'package:cyclo_admin_panel/core/presentation/success_error_flash.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/presentation/styles.dart';
// import '../../../../core/presentation/widgets/input_field.dart';
// import '../../../application/admin_registration_cubit.dart';

// class AddOrEditAdminDialog extends StatefulWidget {
//   const AddOrEditAdminDialog({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<AddOrEditAdminDialog> createState() => _AddOrEditAdminDialogState();
// }

// class _AddOrEditAdminDialogState extends State<AddOrEditAdminDialog> {
//   final formKey = GlobalKey<FormState>();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _clearFields() {
//     _emailController.clear();
//     _passwordController.clear();
//     _firstNameController.clear();
//     _lastNameController.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fillUpAdminFields(context);
//   }

//   void _fillUpAdminFields(BuildContext context) {
//     final admin = context.read<AdminRegistrationCubit>().admin;
//     if (admin != null) {
//       _firstNameController.text = admin.firstName;
//       _lastNameController.text = admin.lastName;
//       _emailController.text = admin.email;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: formKey,
//         child: BlocBuilder<AdminRegistrationCubit, AdminRegistrationState>(
//             builder: (context, state) {
//           return AlertDialog(
//             contentPadding: const EdgeInsets.all(32.0),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(context.read<AdminRegistrationCubit>().admin != null
//                     ? 'Edit Admin'
//                     : 'Add Admin'),
//                 IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(Icons.clear))
//               ],
//             ),
//             content: SizedBox(
//               height: 380,
//               width: 420,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('First Name',
//                         style: TextStyle(color: Colors.grey, fontSize: 14)),
//                     const SizedBox(height: 10),
//                     InputField(
//                       width: 400,
//                       validation: (value) {
//                         if (value!.length < 3) {
//                           return 'This field should be greater than 3 characters';
//                         }
//                         return '';
//                       },
//                       onChanged: context
//                           .read<AdminRegistrationCubit>()
//                           .firstNameChanged,
//                       controller: _firstNameController,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text('Last Name',
//                         style: TextStyle(color: Colors.grey, fontSize: 14)),
//                     const SizedBox(height: 10),
//                     InputField(
//                       width: 400,
//                       onChanged: context
//                           .read<AdminRegistrationCubit>()
//                           .lastNameChanged,
//                       validation: (value) {
//                         if (value!.length < 3) {
//                           return 'This field should be greater than 3 characters';
//                         }
//                         return '';
//                       },
//                       controller: _lastNameController,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text('Email',
//                         style: TextStyle(color: Colors.grey, fontSize: 14)),
//                     const SizedBox(height: 10),
//                     InputField(
//                       width: 400,
//                       onChanged:
//                           context.read<AdminRegistrationCubit>().emailChanged,
//                       validation: (value) {
//                         if (!RegExp(
//                                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                             .hasMatch(value!)) {
//                           return 'Email is not valid';
//                         } else if (value.isEmpty) {
//                           return 'Please enter the email';
//                         }
//                         return '';
//                       },
//                       controller: _emailController,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text('Password',
//                         style: TextStyle(color: Colors.grey, fontSize: 14)),
//                     const SizedBox(height: 10),
//                     InputField(
//                       width: 400,
//                       onChanged: context
//                           .read<AdminRegistrationCubit>()
//                           .passwordChanged,
//                       controller: _passwordController,
//                       validation: (value) {
//                         if (value!.length < 6) {
//                           return 'Password should be greater than 5 characters';
//                         }
//                         return '';
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     const Text('Status',
//                         style: TextStyle(color: Colors.grey, fontSize: 14)),
//                     Theme(
//                       data: Theme.of(context)
//                           .copyWith(unselectedWidgetColor: Styles.borderColor),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Radio(
//                               value: true,
//                               groupValue: state.isActive,
//                               onChanged: (bool? value) {
//                                 context
//                                     .read<AdminRegistrationCubit>()
//                                     .isActiveChanged(value!);
//                               }),
//                           const Text("Active"),
//                           const SizedBox(width: 16),
//                           Radio(
//                               value: false,
//                               groupValue: state.isActive,
//                               onChanged: (bool? value) => context
//                                   .read<AdminRegistrationCubit>()
//                                   .isActiveChanged(value!)),
//                           const Text("Inactive"),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                               minimumSize: const Size(100, 30),
//                               primary: Styles.blueColor,
//                               side: const BorderSide(
//                                   color: Styles.blueColor, width: 1)),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text('Cancel'),
//                         ),
//                         const SizedBox(width: 15),
//                         ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: const Size(100, 30),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                             ),
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 if (context
//                                         .read<AdminRegistrationCubit>()
//                                         .admin !=
//                                     null) {
//                                   state.isValueChanged
//                                       ? context
//                                           .read<AdminRegistrationCubit>()
//                                           .updateAdmin()
//                                       : showErrorFlash(
//                                           context, 'Please edit the form...');
//                                 } else {
//                                   context
//                                       .read<AdminRegistrationCubit>()
//                                       .submit();
//                                   _clearFields();
//                                 }
//                               }
//                             },
//                             child: Text(
//                               context.read<AdminRegistrationCubit>().admin !=
//                                       null
//                                   ? 'Update'
//                                   : 'Submit',
//                             ))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }));
//   }

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
