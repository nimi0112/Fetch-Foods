import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quovantis_assignment/resources/app_colors.dart';
import 'package:quovantis_assignment/resources/styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    @required this.buttonText,
    @required this.onButtonPressed,
    this.lightColor = true,
    this.includeHorizontalPadding = false,
    this.includeBottomPadding = true,
  });

  final String buttonText;
  final Function onButtonPressed;
  final bool lightColor;
  final bool includeHorizontalPadding;
  final bool includeBottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      height: 55,
      margin: EdgeInsets.only(
          bottom: includeBottomPadding ? 43 : 0,
          left: includeHorizontalPadding ? 18 : 0,
          right: includeHorizontalPadding ? 18 : 0),
      child: RaisedButton(
        color: lightColor ? AppColors.white11 : AppColors.grape,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        // ignore: unnecessary_lambdas
        onPressed: () => onButtonPressed(),
        child: RichText(
          text: TextSpan(text: buttonText, style: lightColor ? tsAppBlackBold18 : tsWhiteBold18),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('buttonText', buttonText))
      ..add(DiagnosticsProperty<Function>('onButtonPressed', onButtonPressed))
      ..add(DiagnosticsProperty<bool>('lightColor', lightColor))
      ..add(DiagnosticsProperty<bool>('includeHorizontalPadding', includeHorizontalPadding))
      ..add(DiagnosticsProperty<bool>('includeBottomPadding', includeBottomPadding));
  }
}
