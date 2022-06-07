part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const SPLASH = '/splash';
  static const HOME = '/home';
}
