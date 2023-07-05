import '../../{{app_name}}_exporter.dart';

///This Opens the links in the browser
Future<void> linkLauncher(String link) async {
  if (await canLaunchUrl(Uri.parse(link))) {
    await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $link';
  }
}
