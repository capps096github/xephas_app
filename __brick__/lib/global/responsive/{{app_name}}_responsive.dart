import '../../{{app_name}}_exporter.dart';


/// This class will be used to provide all responsiveness needed in the app
class {{app_name.pascalCase()}}Responsive {
// context
  final BuildContext context;

  {{app_name.pascalCase()}}Responsive({required this.context});

  ///If the `Current Screen Width` is for the `SmallMobile i.e <300`
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 300;

  ///If the `Current Screen Width` is for a `MediumMobile i.e <400`
  static bool isMediumMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 400;

  ///If the `Current Screen Width` is for a `Mobile i.e >= 400 but < 600`
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 400 &&
      MediaQuery.of(context).size.width < 600;

  ///If the `Current Screen Width` is for a `isTablet i.e  >= 600 but < 800`
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 800;

  ///If the `Current Screen Width` is for a `isMediumTablet i.e  >= 800 but < 1024`
  static bool isMediumTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1024;

  ///If the `Current Screen Width` is for a `isLargeTablet i.e  >= 600 but < 800`
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024 &&
      MediaQuery.of(context).size.width < 1200;

  ///If the `Current Screen Width` is for a `isDesktop i.e  > 1200`
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  /// getter for isMobile or isMediumMobile or isSmallMobile
  bool get isMobileScreen =>
      {{app_name.pascalCase()}}Responsive.isMobile(context) ||
      {{app_name.pascalCase()}}Responsive.isMediumMobile(context) ||
      {{app_name.pascalCase()}}Responsive.isSmallMobile(context);

  /// getter for isTablet or isMediumTablet or isLargeTablet
  bool get isTabletScreen =>
      {{app_name.pascalCase()}}Responsive.isTablet(context) ||
      {{app_name.pascalCase()}}Responsive.isMediumTablet(context) ||
      {{app_name.pascalCase()}}Responsive.isLargeTablet(context);

  /// getter for isDesktop
  bool get isDesktopScreen => {{app_name.pascalCase()}}Responsive.isDesktop(context);
}
