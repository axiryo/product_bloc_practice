import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTapFunction;
  final String description;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? buttonColor;

  const CustomButton(
      {Key? key,
      required this.onTapFunction,
      required this.description,
      this.prefixIcon,
      this.suffixIcon,
      this.textColor,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onTapFunction,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 50.h)),
        backgroundColor:
            MaterialStateProperty.all(buttonColor ?? theme.colorScheme.primary),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            SizedBox(
              width: 12.w,
            )
          ],
          Text(
            description,
          ),
          if (suffixIcon != null) ...[
            SizedBox(
              width: 12.w,
            ),
            suffixIcon!,
          ],
        ],
      ),
    );
  }
}
