import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool isMobile() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;

    return shortestSide < 600;
  }

  dynamic back([dynamic result]) => Navigator.pop(this, result);

  Future<dynamic> goTo(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);

  Future<dynamic> goToReplace(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  Future<dynamic> goToClearStack(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (Route<dynamic> route) => false,
        arguments: args,
      );

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (c) {
          ctx = c;

          return PopScope(
            canPop: false,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(this).dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 50,
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      );

  Future<void> showErrorDialog(String message) => AwesomeDialog(
        context: this,
        dismissOnTouchOutside: false,
        dialogType: DialogType.error,
        desc: message,
        width: kDialogWidth,
        btnOkText: 'OK',
        btnOkOnPress: () {},
      ).show();

  Future<void> showSuccessDialog({
    required String message,
    void Function()? onTap,
  }) =>
      AwesomeDialog(
        context: this,
        dismissOnTouchOutside: false,
        dialogType: DialogType.success,
        desc: message,
        width: kDialogWidth,
        btnOkText: 'OK',
        btnOkOnPress: onTap ?? () {},
      ).show();

  Future<void> showQuestionDialog({
    required String message,
    void Function()? onTap,
  }) =>
      AwesomeDialog(
        context: this,
        dismissOnTouchOutside: false,
        dialogType: DialogType.question,
        desc: message,
        width: kDialogWidth,
        btnCancelText: 'no',
        btnCancelOnPress: () {},
        btnOkText: 'OK',
        btnOkOnPress: onTap ?? () {},
      ).show();

  // Future<void> showDialogSuccess(String message, String path) => showDialog(
  //       context: this,
  //       builder: (c) {
  //         ctx = c;

  //         return PopScope(
  //           child: Material(
  //             color: Colors.transparent,
  //             child: Center(
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Theme.of(this).extension<MyAppColors>()!.background,
  //                   borderRadius: BorderRadius.circular(Dimens.cornerRadius),
  //                 ),
  //                 margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
  //                 padding: EdgeInsets.all(Dimens.space24),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     const Text('berhasil'),
  //                     FilledButton(
  //                       onPressed: () {},
  //                       style: FilledButton.styleFrom(
  //                         foregroundColor: Palette.background,
  //                         minimumSize: Size(150.w, 50.w),
  //                       ),
  //                       child: const Text('Simpan dan Daftar'),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}
