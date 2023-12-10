import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:metabizserv/authentication/application/auth/auth_cubit.dart';
import 'package:metabizserv/authentication/presentation/pages/login_page.dart';
import 'package:metabizserv/core/constants/routes.dart';
import 'package:metabizserv/core/shared/service_locator.dart';
import 'package:metabizserv/core/shared/size_config.dart';
import 'package:metabizserv/home/presentation/home_page.dart';
import 'package:metabizserv/splash/splash_page.dart';
import 'pages/error_404_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => AuthCubit(sl(), sl()),
      child: MaterialApp.router(
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }

  final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.splash,
      refreshListenable: GoRouterRefreshStream(sl.get<AuthCubit>().stream),
      errorBuilder: (context, state) => const Error404Page(),
      redirect: (BuildContext context, GoRouterState state) {
        final isGoingToLoginPage = state.matchedLocation == Routes.login;
        final isGoingToRoot = state.matchedLocation == Routes.splash;

        print(sl.get<AuthCubit>().state);
        return sl.get<AuthCubit>().state.maybeWhen(
              orElse: () => null,
              authenticated: (_) =>
                  isGoingToLoginPage || isGoingToRoot ? Routes.home : null,
              unAuthenticated: () => Routes.login,
            );
      },
      routes: [
        GoRoute(
          name: 'dashboard',
          path: Routes.dashboard,
          builder: (context, state) {
            final tab = state.pathParameters['tab']!;
            return HomePage(tab: tab);
          },
        ),
        GoRoute(
          path: Routes.home,
          redirect: (_, state) =>
              state.namedLocation('dashboard', pathParameters: {'tab': 'home'}),
        ),
        GoRoute(
          path: Routes.admin,
          redirect: (_, state) => state
              .namedLocation('dashboard', pathParameters: {'tab': 'admin'}),
        ),
        GoRoute(
          path: Routes.trainees,
          redirect: (_, state) => state
              .namedLocation('dashboard', pathParameters: {'tab': 'trainees'}),
        ),
        GoRoute(
          path: Routes.facilitators,
          redirect: (_, state) => state.namedLocation('dashboard',
              pathParameters: {'tab': 'facilitators'}),
        ),
        GoRoute(
          path: Routes.reporting,
          redirect: (_, state) => state
              .namedLocation('dashboard', pathParameters: {'tab': 'reporting'}),
        ),
        GoRoute(
          path: Routes.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(sl(), sl()),
            child: const LoginPage(),
          ),
        ),
      ]);
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) {
        sl.get<AuthCubit>().state.maybeWhen(
              orElse: () => notifyListeners(),
              error: (error) => null,
            );
      },
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
