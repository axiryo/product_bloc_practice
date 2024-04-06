import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout_technical_exam/theme/theme_bloc.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
  final ThemeData theme = Theme.of(context);
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: theme.colorScheme.primary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

AppBar homeAppBar(BuildContext context, {required String title}) {
  final ThemeData theme = Theme.of(context);
  final bool isDark = theme.brightness == Brightness.dark;
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 24.sp,
        color: theme.colorScheme.primary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          isDark
              ? context.read<ThemeBloc>().add(ThemeEvent.toggleLight)
              : context.read<ThemeBloc>().add(ThemeEvent.toggleDark);
        },
        icon: isDark
            ? Icon(
                Icons.wb_sunny_outlined,
                color: theme.colorScheme.primary,
              )
            : Icon(
                Icons.nightlight_outlined,
                color: theme.colorScheme.primary,
              ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(8.sp, 8.sp, 16.sp, 8.sp),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/sprout_logo.png'),
              ),
            ),
          ),
        ),
      ),
    ],
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
