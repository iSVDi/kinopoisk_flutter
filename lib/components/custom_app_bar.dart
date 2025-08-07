import 'package:flutter/material.dart';

//Improve: Define actions model and put only its not widget directly
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String title;
  final List<Widget>? leadingActions;
  final List<Widget>? trailingActions;
  final Widget? bottomWidget;
  final EdgeInsets? bottomWidgetPadding;

  const CustomAppBar({
    super.key,
    this.height,
    required this.title,
    this.leadingActions,
    this.trailingActions,
    this.bottomWidget,
    this.bottomWidgetPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 20, children: [mainSection(), bottomSection()]);
  }

  //actions and title
  Widget mainSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 60, right: 16),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          actionsWidget(),
          Text(title, style: TextStyle(color: Colors.tealAccent, fontSize: 25)),
        ],
      ),
    );
  }

  Widget actionsWidget() {
    MainAxisAlignment alignment = MainAxisAlignment.spaceBetween;
    List<Widget> rowChildren = [];
    if (leadingActions != null && trailingActions != null) {
      alignment = MainAxisAlignment.spaceBetween;
      rowChildren = leadingActions! + trailingActions!;
    } else if (leadingActions != null) {
      alignment = MainAxisAlignment.start;
      rowChildren = leadingActions!;
    } else if (trailingActions != null) {
      alignment = MainAxisAlignment.end;
      rowChildren = trailingActions!;
    } else {
      return SizedBox.shrink();
    }

    return Row(mainAxisAlignment: alignment, children: rowChildren);
  }

  Widget bottomSection() {
    if (bottomWidget != null) {
      return Padding(
        padding: bottomWidgetPadding ?? EdgeInsets.symmetric(horizontal: 16),
        child: bottomWidget!,
      );
    }
    return SizedBox.shrink();
  }

  @override
  Size get preferredSize {
    double prefHeight = 0;
    if (height != null) {
      prefHeight = height!;
    } else if (bottomWidget == null) {
      prefHeight = 70;
    } else {
      prefHeight = 200;
    }
    return Size.fromHeight(prefHeight);
  }
}
