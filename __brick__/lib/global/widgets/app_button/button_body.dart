import '../../../{{app_name}}_exporter.dart';

class ButtonBody extends ConsumerWidget {
  const ButtonBody({
    super.key,
    required this.buttonColor,
    required this.toolTip,
    required this.text,
    required this.textColor,
    required this.iconData,
    required this.onTap,
    required this.isHovered,
    this.iconWidget,
    required this.isSmallButton,
  });

  final bool isHovered, isSmallButton;

  final Color buttonColor;
  final String? toolTip;
  final String text;
  final Color textColor;
  final IconData? iconData;
  final VoidCallback onTap;

  final Widget? iconWidget;

  @override
  Widget build(BuildContext context, ref) {


    VisualDensity density = Theme.of(context).visualDensity;

    final width = MediaQuery.of(context).size.width;

       final {{app_name.camelCase()}}Responsive = ref.watch({{app_name.camelCase()}}ResponsiveProvider(context));
      //  final {{app_name.camelCase()}}Responsive = {{app_name.pascalCase()}}Responsive(context: context);


    final isDesktop = {{app_name.camelCase()}}Responsive.isDesktopScreen;

    /// True if It has an Icon
    final hasIconData = (iconData != null);
    final hasIconWidget = (iconWidget != null);
    final hasIcon = (hasIconData || hasIconWidget);

    // elevation
    final elevation = isHovered ? spacing8 : spacing0;

    //
    return AnimatedContainer(
      width: isSmallButton ? null : (isDesktop ? width * .6 : width),
      duration: fiftyMilliseconds,
      decoration: BoxDecoration(
        color: isHovered ? buttonColor.withOpacity(.15) : {{app_name.camelCase()}}Transparent,
        borderRadius: borderRadius8,
      ),
      padding: isHovered ? padding2 : (isDesktop ? padding2 : padding0),
      clipBehavior: Clip.antiAlias,
      // for good looking UI o mobile we set this height to 42
      height: isDesktop ? kDesktopButtonHeight : kButtonHeight,
      child: Tooltip(
        message: toolTip ?? text,
        textStyle: TextStyle(color: buttonColor),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: borderRadius4,
        ),
        child: hasIcon
            ? ElevatedButton.icon(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textColor,
                  elevation: elevation,
                  shadowColor: textColor.withOpacity(.15),
                  visualDensity: density,
                ),
                label: Text(
                  text,
                  maxLines: 1,
                ),
                icon: iconWidget ?? Icon(iconData, color: textColor),
              )
            : ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textColor,
                  elevation: elevation,
                  visualDensity: density,
                  shadowColor: textColor.withOpacity(.15),
                ),
                child: Text(
                  text,
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}
