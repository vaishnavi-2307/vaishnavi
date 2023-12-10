// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metabizserv/admin/application/admin_registration_cubit.dart';
import 'package:metabizserv/admin/presentation/pages/register_admin_page.dart';
import 'package:metabizserv/authentication/application/auth/auth_cubit.dart';
import 'package:metabizserv/core/constants/images.dart';
import 'package:metabizserv/core/constants/routes.dart';
import 'package:metabizserv/core/constants/styles.dart';
import 'package:metabizserv/core/constants/text_styles.dart';
import 'package:metabizserv/core/presentation/widgets/navbar_item.dart';
import 'package:metabizserv/core/shared/service_locator.dart';

class HomePage extends StatefulWidget {
  late int tabIndex;

  HomePage({
    Key? key,
    required String tab,
  }) : super(key: key) {
    tabIndex = indexFrom(tab);
  }

  static int indexFrom(String tab) {
    switch (tab) {
      case 'home':
        return 0;
      case 'admin':
        return 1;
      case 'trainees':
        return 2;
      case 'facilitators':
        return 3;
      case 'reporting':
        return 4;

      default:
        return 5;
    }
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showMenu = false;
  @override
  Widget build(BuildContext context) {
    late Widget page;
    switch (widget.tabIndex) {
      case 0:
        page = const Center(child: Text('home'));
        break;
      case 1:
        page = BlocProvider(
          create: (context) => AdminRegistrationCubit(
            sl(),
          ),
          child: const RegisterAdminPage(),
        );
        break;
      case 2:
        page = const Center(child: Text('home'));
        break;
      case 3:
        page = const Center(child: Text('home'));
        break;
      case 4:
        page = const Center(child: Text('home'));
        break;

      default:
        page = const Center(child: Text('Dashboard'));
    }
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => setState(() {
                  showMenu = !showMenu;
                }),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              if (!showMenu)
                NavigationBar(
                  tabIndex: widget.tabIndex,
                ),
            ],
          ),
          Expanded(child: page)
        ],
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);

  final int tabIndex;

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          color: Styles.backgroundColor,
          border: Border(
              right: BorderSide(
            color: Styles.darkGreyColor,
          ))),
      width: 256,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.logo1,
            height: 140,
            width: 180,
          ),
          const SizedBox(
            height: 30,
          ),
          NavbarItem(
            onTap: () => context.go(Routes.home),
            isSelected: widget.tabIndex == 0,
            svgIconPath: AppImages.logo,
            text: 'Home',
            icons: Icons.home,
          ),
          NavbarItem(
            onTap: () => context.go(Routes.admin),
            isSelected: widget.tabIndex == 1,
            svgIconPath: AppImages.logo,
            text: 'Admin',
            icons: Icons.groups_3,
          ),
          NavbarItem(
            onTap: () => context.go(Routes.trainees),
            isSelected: widget.tabIndex == 2,
            svgIconPath: AppImages.logo,
            text: 'Trainees',
            icons: Icons.cabin,
          ),
          NavbarItem(
            onTap: () => context.go(Routes.facilitators),
            isSelected: widget.tabIndex == 3 || widget.tabIndex == 8,
            svgIconPath: AppImages.logo,
            text: 'Facilitators',
            icons: Icons.emoji_emotions_outlined,
          ),
          NavbarItem(
            onTap: () => context.go(Routes.reporting),
            isSelected: widget.tabIndex == 4,
            svgIconPath: AppImages.logo,
            text: 'Reporting',
            icons: Icons.bar_chart,
          ),
          const SizedBox(
            height: 16,
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              TextButton(
                onPressed: () => context.read<AuthCubit>().signOut(),
                child: const Text(
                  'Logout',
                  style: TextStyles.s15w400cwhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
