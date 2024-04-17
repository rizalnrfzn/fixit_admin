import 'package:fixit_admin/constants/dimens.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return PageView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: SizedBox(
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
