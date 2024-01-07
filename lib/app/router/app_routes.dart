part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;

  static const HOME_PAGE = '/home-page';
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
}
