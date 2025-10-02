import 'package:flutter/material.dart';


class Breakpoints {
  static const double mobile = 650;
  static const double tablet = 1100;
}

extension Responsive on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= Breakpoints.mobile;
  bool get isTablet =>
      MediaQuery.of(this).size.width > Breakpoints.mobile &&
          MediaQuery.of(this).size.width <= Breakpoints.tablet;
  bool get isDesktop => MediaQuery.of(this).size.width > Breakpoints.tablet;
}
