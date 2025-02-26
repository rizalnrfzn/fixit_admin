// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/theme/theme_extensions/app_color_scheme.dart';

class UrlNewTabLauncher extends StatelessWidget {
  final String displayText;
  final String url;
  final Color? fontColor;
  final double fontSize;
  final double displayTextRightPadding;

  const UrlNewTabLauncher({
    super.key,
    required this.displayText,
    required this.url,
    this.fontColor,
    this.fontSize = 14.0,
    this.displayTextRightPadding = kTextPadding,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => html.window.open(url, "_blank"),
            child: Tooltip(
              message: context.l10n.openInNewTab,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: displayTextRightPadding),
                    child: Text(
                      displayText,
                      style: TextStyle(
                        color: (fontColor ??
                            themeData.extension<AppColorScheme>()!.hyperlink),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.exit_to_app_rounded,
                    size: (fontSize + 2.0),
                    color: (fontColor ??
                        themeData.extension<AppColorScheme>()!.hyperlink),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
