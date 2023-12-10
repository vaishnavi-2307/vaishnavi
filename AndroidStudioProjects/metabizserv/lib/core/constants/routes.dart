abstract class Routes {
  static const dashboard =
      '/dashboard/:tab(home|admin|trainees|facilitators|reporting)';
  static const home = '/home';
  static const admin = '/admin';
  static const trainees = '/trainees';
  static const facilitators = '/facilitators';
  static const reporting = '/reporting';
  static const login = '/login';
  static const splash = '/';
}
