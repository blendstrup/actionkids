import 'package:flutter/material.dart';
// Pages
import 'homepage/homepage.dart';
import 'error/not_found_page.dart';
import 'settings_page/settings_page.dart';
import 'programme_edit/programme_edit.dart';
import 'control_page/control_page.dart';

class Router {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case 'settings':
        return MaterialPageRoute(builder: (context) => SettingsPage());
      case 'programme_edit':
        return MaterialPageRoute(builder: (context) => ProgrammeEditPage());
      case 'control':
        return MaterialPageRoute(builder: (context) => ControlLoad());
      default:
        return MaterialPageRoute(builder: (context) => NotFoundPage());
    }
  }
}
